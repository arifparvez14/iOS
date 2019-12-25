//
//  ViewController.swift
//  Local Notification
//
//  Created by SOL iOS Mac Mini on 6/25/19.
//  Copyright © 2019 com.arif. All rights reserved.
//

import UIKit
import UserNotifications

class ViewController: UIViewController {

    
    @IBOutlet weak var buttonTapped: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert,.sound,.badge]) {(didAllow, error) in
            print("granted: \(didAllow)")}
    }

    @IBAction func buttonTappedDone(_ sender: Any) {
        let content = UNMutableNotificationContent()
        content.title = "The App Notification Warning!"
        content.subtitle = "Please allow the notification"
        content.body = "Accessing user permission for notification setup"
        content.badge = 1
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
        let request = UNNotificationRequest(identifier: "timerDone", content: content, trigger: trigger)
        UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
    }
}

