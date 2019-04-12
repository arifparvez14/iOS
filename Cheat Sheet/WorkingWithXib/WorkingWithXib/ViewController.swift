//
//  ViewController.swift
//  WorkingWithXib
//
//  Created by SOL iOS Mac Mini on 4/4/19.
//  Copyright © 2019 com.arif. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var featureView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addSubview(featureView)
        featureView.backgroundColor = UIColor.red
        
        if let featureView2 = Bundle.main.loadNibNamed("CustomView", owner: self, options: nil)?.first as? Feature_View{
            self.view.addSubview(featureView2)
        }
    }


}

