//
//  ViewController.swift
//  SaveUserSession
//
//  Created by SOL iOS Mac Mini on 3/11/19.
//  Copyright © 2019 com.arif. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var firstName: UITextField!
    @IBOutlet weak var lastName: UITextField!
    
    @IBOutlet weak var clearButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    @IBAction func saveButtonClicked(_ sender: UIButton) {
        let defaults = UserDefaults.standard
        defaults.set(firstName.text, forKey: "firstName")
        defaults.set(lastName.text, forKey: "lastName")
        defaults.synchronize()
        print("fn=\(firstName.text), ln=\(lastName.text)")
    }
    
    @IBAction func clearButtonClicked(_ sender: Any) {
        if(firstName.text == ""){
            loadDefaults()
            clearButton.setTitle("Clear", for: .normal)
        }
        else{
            firstName.text = ""
            lastName.text = ""
            clearButton.setTitle("Load", for: .normal)
        }
    }
    
    func loadDefaults() {
        let defaults = UserDefaults.standard
        firstName.text = defaults.object(forKey: "firstName") as? String
        lastName.text = defaults.object(forKey: "lastName") as? String
    }
    
}

