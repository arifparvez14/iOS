//
//  SecondVC.swift
//  Pass Data with NSNotfication
//
//  Created by SOL MAC 15 on 16/8/19.
//  Copyright © 2019 SOL MAC 15. All rights reserved.
//

import UIKit

class SecondVC: UIViewController {

    @IBOutlet weak var secondVCLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(doThisWhenNotify),
                                               name: NSNotification.Name(rawValue: myNotoficationKey),
                                               object: nil)
    }
    @objc func doThisWhenNotify() { print("I've sent a spark!") }
    
    
    @IBAction func tabToNotifyBack(_ sender: Any) {
        //NotificationCenter.default.post(name: Notification.Name(rawValue: myNotoficationKey), object: self)
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: myNotoficationKey), object: nil, userInfo: ["name":"Bob"])

        secondVCLabel.text = "Notification Completed!😜"
    }
    
}
