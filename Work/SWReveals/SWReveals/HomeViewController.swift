//
//  HomeViewController.swift
//  SWReveals
//
//  Created by SOL iOS Mac Mini on 7/8/19.
//  Copyright © 2019 com.siliconorchard. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var menuButton: UIBarButtonItem!
    override func viewDidLoad() {
        super.viewDidLoad()
        menuButton.target = self.revealViewController()
        menuButton.action = #selector(SWRevealViewController.revealToggle(_:))
        self.view.addGestureRecognizer((self.revealViewController()?.panGestureRecognizer())!)
        self.revealViewController()?.rearViewRevealWidth = 300
    }
    

}
