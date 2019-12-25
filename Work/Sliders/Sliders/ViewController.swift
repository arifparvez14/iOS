//
//  ViewController.swift
//  Sliders
//
//  Created by SOL iOS Mac Mini on 7/8/19.
//  Copyright © 2019 com.siliconorchard. All rights reserved.
//

import UIKit
import SideMenu

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        SideMenuManager.default.menuAddPanGestureToPresent(toView: self.navigationController!.navigationBar)
        SideMenuManager.default.menuAddScreenEdgePanGesturesToPresent(toView: self.navigationController!.view)
        
        SideMenuManager.default.menuAnimationBackgroundColor = UIColor.red
    }
}

