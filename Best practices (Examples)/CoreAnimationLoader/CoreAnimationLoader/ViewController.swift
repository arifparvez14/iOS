//
//  ViewController.swift
//  CoreAnimationLoader
//
//  Created by Sharetrip-iOS on 06/07/2021.
//

import UIKit

class ViewController: UIViewController {

    var signView = SignView(frame: CGRect.zero)
    var testView = TestView(frame: CGRect.zero)
    var testView1 = TestView1(frame: CGRect.zero)

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.orange
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        //addSignView()
        //addTestView()
        addTestView1()
    }
    
    func addSignView() {
        signView.frame = CGRect(x: 0,
                                y: 0,
                                width: UIScreen.main.bounds.width,
                                height: UIScreen.main.bounds.height)
        
        self.view.addSubview(signView)
        signView.addAnimationLayer()
    }
    
    
    func addTestView() {
        let boxSize: CGFloat = 200.0

        testView.frame = CGRect(x: 16,
                                y: 350,
                                width: boxSize,
                                height: boxSize)
        self.view.addSubview(testView)
        testView.addAnimationLayer()
    }
    
    func addTestView1() {

        testView1.frame = CGRect(x: 0,
                                y: 0,
                                width: UIScreen.main.bounds.size.width,
                                height: UIScreen.main.bounds.size.height)
        self.view.addSubview(testView1)
        testView1.addAnimationLayer()
    }
}

