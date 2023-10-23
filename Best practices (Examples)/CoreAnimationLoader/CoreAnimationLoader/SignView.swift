//
//  SignView.swift
//  CoreAnimationLoader
//
//  Created by Sharetrip-iOS on 06/07/2021.
//

import UIKit

class SignView: UIView {
    
    let upCirleLayer = CAShapeLayer.init()
    var path = UIBezierPath.init()
    var animationDuration: Double = 2
    var frameHeight: CGFloat = 50.0
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.black.withAlphaComponent(0.5)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        fatalError("init(coder:) has not been implemented")
    }
    
    var signWavePath: UIBezierPath {
        var clockCycle = true
        let yPoint = self.frame.size.height / 2
        frameHeight = self.frame.size.width / 2
        
        for x in 1...24 {
            if x % 2 != 0 {
                let xpath = UIBezierPath(arcCenter: CGPoint(x: CGFloat(x) * frameHeight / 2, y: yPoint),
                                         radius: frameHeight / 2,
                                         startAngle: 180.0 * .pi/180.0,
                                         endAngle: 0.0,
                                         clockwise: clockCycle)
                
                path.append(xpath)
                
                clockCycle ? (clockCycle = false) : (clockCycle = true)
            }
        }
        
        return path
    }
    
    func addAnimationLayer() {
        upCirleLayer.fillColor = UIColor.clear.cgColor
        upCirleLayer.strokeColor = UIColor.white.cgColor
        upCirleLayer.lineWidth = 8.0
        upCirleLayer.path = signWavePath.cgPath
        layer.addSublayer(upCirleLayer)
        
        animateStrokeUpCircle()
        
        Timer.scheduledTimer(timeInterval: animationDuration, target: self, selector: #selector(animateStrokeUpCircle), userInfo: nil, repeats: true)
        
    }
    
    @objc func animateStrokeUpCircle() {
        let strokeAnimation: CABasicAnimation = CABasicAnimation(keyPath: "strokeEnd")
        strokeAnimation.fromValue = 0.0
        strokeAnimation.toValue = 1.0
        strokeAnimation.duration = animationDuration
        strokeAnimation.isRemovedOnCompletion = false
        upCirleLayer.add(strokeAnimation, forKey: nil)
        expand()
    }
    
    func expand() {
        let expandAnimation: CABasicAnimation = CABasicAnimation(keyPath: "position")
        expandAnimation.fromValue = [0, sin(self.frame.width)]
        expandAnimation.toValue = [-self.frame.width, cos(self.frame.width)]
        expandAnimation.duration = animationDuration
        expandAnimation.fillMode = CAMediaTimingFillMode.forwards
        expandAnimation.isRemovedOnCompletion = false
        upCirleLayer.add(expandAnimation, forKey: nil)
    }
}
