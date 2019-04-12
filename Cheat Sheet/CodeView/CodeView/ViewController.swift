//
//  ViewController.swift
//  CodeView
//
//  Created by SOL iOS Mac Mini on 4/2/19.
//  Copyright © 2019 com.arif. All rights reserved.
//

import UIKit
import SwiftyCodeView

class ViewController: UIViewController {

    @IBOutlet weak var customCodeView: CustomCodeView!


}

extension ViewController: SwiftyCodeViewDelegate {
    func codeView(sender: SwiftyCodeView, didFinishInput code: String) {
    }
}

