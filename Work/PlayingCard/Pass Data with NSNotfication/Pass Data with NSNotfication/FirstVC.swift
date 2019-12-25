//
//  FirstVC.swift
//  Pass Data with NSNotfication
//
//  Created by SOL MAC 15 on 16/8/19.
//  Copyright © 2019 SOL MAC 15. All rights reserved.
//

import UIKit

class FirstVC: UIViewController {

    @IBOutlet weak var firstVCLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        NotificationCenter.default.addObserver(self,
//                                               selector: #selector(doSomethingAfterNotified),
//                                               name: NSNotification.Name(rawValue: myNotoficationKey),
//                                               object: nil)
        NotificationCenter.default.addObserver(forName: NSNotification.Name(rawValue: myNotoficationKey),
                                               object: nil,
                                               queue: nil,
                                               using:catchNotification)
        
    }
//    @objc func doSomethingAfterNotified() {
//        print("I've been notified")
//        firstVCLabel.text = "Damn, I feel your spark 😱"
//    }
    func catchNotification(notification:Notification) -> Void {
        guard let name = notification.userInfo!["name"] else { return }
        
        firstVCLabel.text = "My name, \(name) has been passed! 😄"
    }
    
}



