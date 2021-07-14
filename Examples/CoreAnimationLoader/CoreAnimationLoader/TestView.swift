//
//  TestView.swift
//  CoreAnimationLoader
//
//  Created by Sharetrip-iOS on 06/07/2021.
//

import UIKit

class TestView: UIView {
    
    let upCircleLayer = CAShapeLayer.init()
    let downCircleLayer = CAShapeLayer.init()
    
    var path1 = UIBezierPath.init()
    var path2 = UIBezierPath.init()
    
    var animationDirection : Bool = true
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.clear
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
    
    var up1Circle: UIBezierPath {
        return UIBezierPath(arcCenter: CGPoint(x: self.frame.size.width/4, y: self.frame.size.height/2),
                            radius: self.frame.size.height/4,
                            startAngle: 180.0 * .pi/180.0,
                            endAngle: 0.0,
                            clockwise: true)
    }
    var down2Circle: UIBezierPath {
        return UIBezierPath(arcCenter: CGPoint(x: 3*self.frame.size.width/4, y: self.frame.size.height/2),
                            radius: self.frame.size.height/4,
                            startAngle: 180.0 * .pi/180.0,
                            endAngle: 0.0,
                            clockwise: false)
    }
    
    var up22Circle: UIBezierPath {
        return UIBezierPath(arcCenter: CGPoint(x: 3*self.frame.size.width/4, y: self.frame.size.height/2),
                            radius: self.frame.size.height/4,
                            startAngle: 180.0 * .pi/180.0,
                            endAngle: 0.0,
                            clockwise: true)
    }
    var down11Circle: UIBezierPath {
        return UIBezierPath(arcCenter: CGPoint(x: self.frame.size.width/4, y: self.frame.size.height/2),
                            radius: self.frame.size.height/4,
                            startAngle: 180.0 * .pi/180.0,
                            endAngle: 0.0,
                            clockwise: false)
    }
    
    
    
    var up2Circle: UIBezierPath {
        return UIBezierPath(arcCenter: CGPoint(x: 3*self.frame.size.width/4, y: self.frame.size.height/2),
                            radius: self.frame.size.height/4,
                            startAngle: 0.0,
                            endAngle: 180.0 * .pi/180.0,
                            clockwise: true)
    }
    var down1Circle: UIBezierPath {
        return UIBezierPath(arcCenter: CGPoint(x: self.frame.size.width/4, y: self.frame.size.height/2),
                            radius: self.frame.size.height/4,
                            startAngle: 0.0,
                            endAngle: 180.0 * .pi/180.0,
                            clockwise: false)
    }
    
    func addAnimationLayer() {
        
        path1.append(up1Circle);
        path1.append(down2Circle);
        
        path2.append(down11Circle)
        path2.append(up22Circle)
        
        
        
        // Add Upper Circle Layer
        upCircleLayer.fillColor = UIColor.clear.cgColor
        upCircleLayer.strokeColor = UIColor.black.cgColor
        upCircleLayer.lineWidth = 8.0
        upCircleLayer.path = path1.cgPath
        layer.addSublayer(upCircleLayer)
        
        
        Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(expand1), userInfo: nil, repeats: true)
        
    }
    
    func expand() {
        
        if animationDirection{
            //upCircleLayer.path = path1.cgPath
            let expandAnimation: CABasicAnimation = CABasicAnimation(keyPath: "path")
            expandAnimation.fromValue = path1.cgPath
            expandAnimation.toValue = path2.cgPath
            expandAnimation.duration = 1.5
            //expandAnimation.fillMode = kCAFillModeForwards
            expandAnimation.isRemovedOnCompletion = false
            upCircleLayer.add(expandAnimation, forKey: nil)
            
            animationDirection = false
        }
        else{
            //upCircleLayer.path = path2.cgPath
            let expandAnimation: CABasicAnimation = CABasicAnimation(keyPath: "path")
            expandAnimation.fromValue = path2.cgPath
            expandAnimation.toValue = path1.cgPath
            expandAnimation.duration = 1.5
            //expandAnimation.fillMode = kCAFillModeForwards
            expandAnimation.isRemovedOnCompletion = false
            upCircleLayer.add(expandAnimation, forKey: nil)
            animationDirection = true
        }
        
        
    }
    
    
    @objc func expand1() {
        
        let expandAnimation: CABasicAnimation = CABasicAnimation(keyPath: "position")
        expandAnimation.fromValue = [0,self.frame.height/2]
        expandAnimation.toValue = 500
        expandAnimation.duration = 2.0
        expandAnimation.fillMode = CAMediaTimingFillMode.forwards
        expandAnimation.isRemovedOnCompletion = false
        upCircleLayer.add(expandAnimation, forKey: nil)
    }
}
