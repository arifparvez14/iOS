//
//  WelcomeVC.swift
//  
//
//  Created by SOL MAC 15 on 25/3/20.
//

import UIKit

class WelcomeVC: UIViewController {

    @IBOutlet var sessionTF: UITextField!
    @IBOutlet var goBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sessionTF.layer.borderWidth = 1
        sessionTF.layer.borderColor = UIColor(red: 255, green: 233, blue: 0, alpha: 1).cgColor
        goBtn.layer.cornerRadius = 5
        sessionTF.isHidden = true
    }
    
    @IBAction func goBtnTapped(_ sender: Any) {
        print("Go btn")
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        self.present(nextViewController, animated:true, completion:nil)
    }
}
