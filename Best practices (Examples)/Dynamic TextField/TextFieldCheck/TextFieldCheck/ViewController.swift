//
//  ViewController.swift
//  TextFieldCheck
//
//  Created by Muhammad Ariful islam on 15/10/23.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var customTextField: CustomTextField!
    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var textCountLabel: UILabel!
    
    private let regex = "^[0-9]*$"
    private let allowCharacters = CharacterSet(charactersIn: "!@#$")
    private let disallowCharacters = CharacterSet(charactersIn: "!@#$")
    private var totalCharactersSet = CharacterSet(charactersIn: "!@#$%^&*()_+{}[]|\"<>,.~`/:;?-=\\¥'£•¢")
    
    var inputSetType: InputSetType = .validCharacterSet(nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        inputSetType = .validCharacterSet(nil)
        configTextField()
    }
    
    private func configTextField() {
        switch inputSetType {
        case .allowCharactersSet(_):
            customTextField.config(inputSetType: .allowCharactersSet(allowCharacters))
        case .disallowCharacterSet(_):
            customTextField.config(inputSetType: .disallowCharacterSet(disallowCharacters), totalCharacterSet: totalCharactersSet, maxLength: 7)
        case .validCharacterSet(_):
            customTextField.config(inputSetType: .validCharacterSet(NSCharacterSet.decimalDigits))
        case .invalidCharacterSet(_):
            customTextField.config(inputSetType: .invalidCharacterSet(NSCharacterSet.lowercaseLetters))
        case .regex(_):
            customTextField.config(inputSetType: InputSetType.regex(regex))
        }
    }
    
    @IBAction func showText(_ sender: Any) {
        textLabel.text = customTextField.text
        textCountLabel.text = "Count: \(customTextField.text?.count ?? 0)"
    }
}

