//
//  ViewController.swift
//  SingleProgressBar
//
//  Created by SOL MAC 15 on 28/10/19.
//  Copyright © 2019 SOL MAC 15. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var progressLabel: UILabel!
    @IBOutlet weak var progressView: UIProgressView!
    @IBOutlet weak var startCount: UIButton!
    let progress = Progress()
    var value = 0.0
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func startCount(_ sender: Any) {
        //progressView.progress = 0
        //progress.completedUnitCount = 0
        
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { (timer) in
            guard self.progress.isFinished == false else {
                timer.invalidate()
                return
            }
        }

        self.progress.completedUnitCount += 1

        let progressFloat = Float(self.progress.fractionCompleted)
        self.progressView.setProgress(progressFloat, animated: true)
        self.progressLabel.text = "\(Int(self.progress.fractionCompleted * 100)) %"
    }
    
    
}

