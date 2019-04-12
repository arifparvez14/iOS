//
//  ViewController.swift
//  Validation Handler
//
//  Created by SOL iOS Mac Mini on 3/14/19.
//  Copyright © 2019 com.arif. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var tf_email: UITextField!
    @IBOutlet weak var tf_password: UITextField!
    @IBOutlet weak var tf_phoneNumber: UITextField!
   
    
    override func viewDidLoad() {
      
        
    }
    @IBAction func loginUser(_ sender: Any) {
        
        guard let email = tf_email.text, tf_email.text?.count != 0 else{
            let title = "Email field is empty"
            alertControll(setTitle: title)
            return
        }
        
        if isValidEmail(emailID: email) == false{
            let title = "Invalid Email Address"
            alertControll(setTitle: title)
            return
            
        }
        guard let _ = tf_password.text, tf_password.text?.count != 0 else{
            let title = "Password field is empty"
            alertControll(setTitle: title)
            return
        }
    }
    func isValidEmail(emailID:String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: emailID)
    }
    
    func alertControll(setTitle: String)
    {
        let alertView = UIAlertController(title: setTitle, message: "Try Again", preferredStyle: .alert)
        alertView.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        present(alertView, animated:true, completion:nil)
    }
    
}

