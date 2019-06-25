//
//  ViewController.swift
//  NotoficationLearning
//
//  Created by SOL iOS Mac Mini on 6/25/19.
//  Copyright © 2019 com.arif. All rights reserved.
//

import UIKit
import UserNotifications

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupLocalNotification()
        
    }
    
    func setupLocalNotification()
    {
        let content = UNMutableNotificationContent()
        content.title = "App Notification Warning!"
        content.body = "Accessing user permission for notification setup"
        content.sound = UNNotificationSound.default
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
        let request = UNNotificationRequest(identifier: "timerDone", content: content, trigger: trigger)
        UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
    }

}

