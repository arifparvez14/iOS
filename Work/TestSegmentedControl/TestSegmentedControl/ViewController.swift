//
//  ViewController.swift
//  TestSegmentedControl
//
//  Created by SOL iOS Mac Mini on 3/22/19.
//  Copyright © 2019 com.arif. All rights reserved.
//

import UIKit
import TTSegmentedControl

class ViewController: UIViewController {

    @IBOutlet weak var segmentControl: TTSegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        segmentControl.itemTitles = ["Login", "Register"]
        segmentControl.defaultTextColor = UIColor.white
        segmentControl.selectedTextColor = UIColor.black
        segmentControl.didSelectItemWith = { (index, title) in
            if title == "Login" {
                print("Login")
            } else {
                print("Register")
            }
        }
    }


}

