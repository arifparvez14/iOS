//
//  ViewController.swift
//  FRNOPOD
//
//  Created by Sharetrip-iOS on 14/07/2021.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        super.viewDidLoad()
        let button = UIButton(type: .roundedRect)
        button.frame = CGRect(x: 20, y: 50, width: 100, height: 30)
        button.setTitle("SceondVC", for: [])
        button.addTarget(self, action: #selector(self.crashButtonTapped(_:)), for: .touchUpInside)
        view.addSubview(button)
        
        Crashlytics.crashlytics().log("Second project Controller")
        Crashlytics.crashlytics().setCustomValue(13037, forKey: "ID")
        Crashlytics.crashlytics().setUserID("124802")
        
        let userInfo = [
            NSLocalizedDescriptionKey: NSLocalizedString("The request failed", comment: ""),
            "ProductID": "0001",
            "UserID": "Arif Parvez"
        ]
        
        let error = NSError(domain: NSURLErrorDomain, code: -1001, userInfo: userInfo)
        Crashlytics.crashlytics().record(error: error)
    }
    
    @IBAction func crashButtonTapped(_ sender: AnyObject) {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "ThirdVC") as! ThirdVC
        self.present(nextViewController, animated:true, completion:nil)
    }
}

