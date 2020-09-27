//
//  ViewController.swift
//  IntroToCombine
//
//  Created by Sharetrip-iOS on 27/09/2020.
//  Copyright © 2020 AP. All rights reserved.
//

import UIKit
import Combine

extension Notification.Name {
    static let newMessage = Notification.Name("newMessage")
}

struct Message{
    let content: String
    let auther: String
}

class ViewController: UIViewController {

    @IBOutlet weak var allowMessageSwitch: UISwitch!
    @IBOutlet weak var sendButton: UIButton!
    @IBOutlet weak var messageLabel: UILabel!

    @Published var canSendMessages: Bool = false
    //var canSendMessages: Bool = false

    private var switchSubscriber: AnyCancellable?

    override func viewDidLoad() {
        super.viewDidLoad()
         setupPeocessingChange()
    }

    func setupPeocessingChange() {
        switchSubscriber = $canSendMessages.assign(to: \.isEnabled, on: sendButton)

        let messagePublisher = NotificationCenter.Publisher(center: .default, name: .newMessage).map{notification -> String? in
            return (notification.object as? Message)?.content ?? ""
        }

        let messageSubscriber = Subscribers.Assign(object: messageLabel, keyPath: \.text)
        messagePublisher.subscribe(messageSubscriber)
    }


    @IBAction func didSwitch(_ sender: UISwitch) {
        canSendMessages = sender.isOn
    }

    @IBAction func sendMessage(_ sender: Any) {
        let message = Message(content: "The current time is \(Date())", auther: "Arif")
        NotificationCenter.default.post(name: .newMessage, object: message)
    }
}

