//
//  CustomTextField.swift
//  TextFieldCheck
//
//  Created by Muhammad Ariful islam on 15/10/23.
//

import UIKit

enum InputSetType {
    case allowCharactersSet(CharacterSet?)
    case disallowCharacterSet(CharacterSet?)
    case validCharacterSet(CharacterSet?)
    case invalidCharacterSet(CharacterSet?)
    case regex(String?)
}

@IBDesignable
open class CustomTextField: UITextField {
    
    @IBInspectable var maxLength: Int = 5
    var border = CALayer()
    
    private var allowedCharactersSet: CharacterSet?
    private var disallowedCharactersSet: CharacterSet?
    private var inputSetType: InputSetType?
    private var totalCharactersSet = CharacterSet(charactersIn: "!@#$%^&*()_+{}[]|\"<>,.~`/:;?-=\\¥'£•¢")
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    private func setup() {
        border = CALayer()
        let width = CGFloat(2.0)
        border.borderColor = UIColor.darkGray.cgColor
        border.frame = CGRect(x: 0, y: self.frame.size.height - width, width: self.frame.size.width, height: self.frame.size.height)
        border.borderWidth = width
        self.layer.addSublayer(border)
        self.layer.masksToBounds = true
        self.delegate = self
    }
    
    /// Configure textfield.
    /// - Parameter:
    ///     - inputSetType: Set the input type. Input set type can be:
    ///         - allowCharactersSet: Only those characters will be allowed to input. Other characters from the total characters are not allowed.
    ///         - disallowCharacterSet: Only those characters will be disallowed to input. Other characters from the total characters are allowed.
    ///         - validCharacterSet: Only those characters will be allowed to input. Any other characters are not allowed.
    ///         - invalidCharacterSet: Only those characters will be disallowed to input. Any other characters are allowed.
    ///         - regex: Strict textfield input via any regular expression
    ///
    ///     - totalCharacterSet (Optional): Provide total character set.
    ///         - default character set: "!@#$%^&*()_+{}[]|\"<>,.~`/:;?-=\\¥'£•¢"
    ///     - maxLength (Optional): Set the max length of the input text. It is also an @IBInspectable property.
    ///         - default length: 5
    
    func config(inputSetType: InputSetType, totalCharacterSet: CharacterSet? = nil, maxLength: Int? = nil) {
        self.inputSetType = inputSetType
        
        if let characterSet = totalCharacterSet {
            self.totalCharactersSet = characterSet
        }
        
        if let maxLength = maxLength {
            self.maxLength = maxLength
        }
        
        setAllowDisallowList()
    }
    
    private func setAllowDisallowList() {
        guard let inputSetType = self.inputSetType else { return }
        
        switch inputSetType {
        case .allowCharactersSet(let character):
            allowedCharactersSet = character ?? CharacterSet()
            disallowedCharactersSet = totalCharactersSet.subtracting(character ?? CharacterSet())
        case .disallowCharacterSet(let characters):
            disallowedCharactersSet = characters ?? CharacterSet()
            allowedCharactersSet = totalCharactersSet.subtracting(characters ?? CharacterSet())
        case .regex(_), .invalidCharacterSet(_), .validCharacterSet(_):
            return
        }
    }
    
    private func textValidateUsingRegex(text: String, regex: String) -> Bool {
        return NSPredicate(format: "SELF MATCHES %@", regex).evaluate(with: text)
    }
    
    private func validateStringLength(of string: String) -> Bool{
        return string.count <= maxLength
    }
}

extension CustomTextField: UITextFieldDelegate {
    
    public func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        let currentString = (textField.text ?? "") as NSString
        let newString = currentString.replacingCharacters(in: range, with: string)
        guard let inputSetType = self.inputSetType else { return false}
        
        switch inputSetType {
        case .allowCharactersSet(_), .disallowCharacterSet(_):
            
            //check allow characters list
            if let allowedCharactersSet {
                if let _ = string.rangeOfCharacter(from: allowedCharactersSet),
                   validateStringLength(of: newString) {
                    return true
                }
            }
            
            //check disallowed character list
            if let disallowedCharactersSet {
                if string.rangeOfCharacter(from: disallowedCharactersSet) != nil {
                    return false
                }
            }
            
        //Checking textfield with regex
        case .regex(let regex):
            guard let regex = regex else {return false}
            
            if !textValidateUsingRegex(text: newString, regex: regex) {
                return false
            }
            
        //Checking with valid character set
        case .validCharacterSet(let characterSet):
            guard let characterSet = characterSet else { return false }
            if let _ = string.rangeOfCharacter(from: characterSet),
               validateStringLength(of: newString) {
                return true
            } else {
                return false
            }
            
        //Checking with invalid character set
        case .invalidCharacterSet(let characterSet):
            guard let characterSet = characterSet else { return false }
            
            if string.rangeOfCharacter(from: characterSet) != nil {
                return false
            }
        }
        
        return validateStringLength(of: newString)
    }
}


