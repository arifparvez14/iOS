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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let regex = "^[0-9]*$"
        let characters = CharacterSet(charactersIn: "!@#$%^&*()")
        //customTextField.config(inputSetType: InputSetType.regex(regex))
        
        let inputCharacters = CharacterSet(charactersIn: "!@#$")
        //customTextField.config(inputSetType: .allowCharactersSet(inputCharacters))
        //customTextField.config(inputSetType: InputSetType.disallowCharacterSet(inputCharacters), totalCharacterSet: characters, maxLength: 10)
        //var ch = NSCharacterSet.decimalDigits
        customTextField.config(inputSetType: .validCharacterSet(NSCharacterSet.decimalDigits))
    }
    
    @IBAction func showText(_ sender: Any) {
        textLabel.text = customTextField.text
        textCountLabel.text = "Count: \(customTextField.text?.count ?? 0)"
    }
}

