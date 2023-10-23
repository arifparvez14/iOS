//
//  ViewController.swift
//  LottiExample
//
//  Created by Sharetrip-iOS on 04/07/2021.
//

import UIKit
import Lottie


class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let loader = LottiLoader(onView: self.view)
        loader.show()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 10000.0) {
            loader.hide()
        }
    }
}

class LottiLoader {
    var animationView: AnimationView?
    
    init(onView: UIView) {
        let width: CGFloat = 150
        let height: CGFloat = 150
        
        let animation = Animation.named("Loader")
        animationView = AnimationView(animation: animation)
        animationView?.frame = CGRect(x: UIScreen.main.bounds.width / 2 - (width / 2), y: UIScreen.main.bounds.height / 2 - (height / 2), width: width, height: height)
        animationView?.backgroundColor = UIColor.gray.withAlphaComponent(0.2)
        animationView?.layer.cornerRadius = 10.0
        onView.addSubview(animationView!)
    }
    
    func show() {
        animationView?.play(fromProgress: 0,
                                toProgress: 1,
                                loopMode: LottieLoopMode.loop,
                                completion: nil)
    }
    
    func hide() {
        animationView?.stop()
        animationView?.removeFromSuperview()
    }
}

