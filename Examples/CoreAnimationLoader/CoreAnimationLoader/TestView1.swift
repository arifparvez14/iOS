//
//  TestView1.swift
//  CoreAnimationLoader
//
//  Created by Sharetrip-iOS on 06/07/2021.
//

import UIKit

class TestView1: UIView {
    let animationLayer = CAShapeLayer.init()
    
    var path1 = UIBezierPath.init()
    var path2 = UIBezierPath.init()
    var path = UIBezierPath.init()
    var circleRadius : CGFloat = 26.0;
    var centerLineHeight : CGFloat = 40.0
    var animationDuration : Double = 2.0
    
    var animationDirection : Bool = true
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.black
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
    var centerMainLine: UIBezierPath {
        let frameSize = self.frame.size
        let centerLine = UIBezierPath()
        centerLine.move(to: CGPoint(x: frameSize.width/2, y: frameSize.height/2 - centerLineHeight/2))
        centerLine.addLine(to: CGPoint(x: frameSize.width/2, y: frameSize.height/2 + centerLineHeight/2))
        return centerLine
    }
    
    var upLeftCircle: UIBezierPath {
        let frameSize = self.frame.size
        let halfCircle = UIBezierPath(arcCenter: CGPoint(x: frameSize.width/2 - circleRadius, y: frameSize.height/2 - centerLineHeight/2),
                                      radius: circleRadius,
                                      startAngle: 180.0 * .pi/180.0,
                                      endAngle: 0.0,
                                      clockwise: true)
        return halfCircle
    }
    var upRightCircle: UIBezierPath {
        let frameSize = self.frame.size
        let halfCircle = UIBezierPath(arcCenter: CGPoint(x: frameSize.width/2 + circleRadius, y: frameSize.height/2 - centerLineHeight/2),
                                      radius: circleRadius,
                                      startAngle: 180.0 * .pi/180.0,
                                      endAngle: 0.0,
                                      clockwise: true)
        return halfCircle
    }
    var downLeftCircle: UIBezierPath {
        let frameSize = self.frame.size
        let halfCircle = UIBezierPath(arcCenter: CGPoint(x: frameSize.width/2 - circleRadius, y: frameSize.height/2 + centerLineHeight/2),
                                      radius: circleRadius,
                                      startAngle: 180.0 * .pi/180.0,
                                      endAngle: 0.0,
                                      clockwise: false)
        return halfCircle
    }
    var downRightCircle: UIBezierPath {
        let frameSize = self.frame.size
        let halfCircle = UIBezierPath(arcCenter: CGPoint(x: frameSize.width/2 + circleRadius, y: frameSize.height/2 + centerLineHeight/2),
                                      radius: circleRadius,
                                      startAngle: 180.0 * .pi/180.0,
                                      endAngle: 0.0,
                                      clockwise: false)
        return halfCircle
    }
    
    func drawUpCircle(centerPoint:CGPoint, radiusValue:CGFloat) -> UIBezierPath {
        
        let halfCircle = UIBezierPath(arcCenter: centerPoint,
                                      radius: radiusValue,
                                      startAngle: 180.0 * .pi/180.0,
                                      endAngle: 0.0,
                                      clockwise: true)
        return halfCircle
    }
    func drawDownCircle(centerPoint:CGPoint,radiusValue:CGFloat) -> UIBezierPath {
        
        let halfCircle = UIBezierPath(arcCenter: centerPoint,
                                      radius: radiusValue,
                                      startAngle: 180.0 * .pi/180.0,
                                      endAngle: 0.0,
                                      clockwise: false)
        return halfCircle
    }
    func drawLine(fromPoint:CGPoint,toPoint:CGPoint) -> UIBezierPath {
        
        let line = UIBezierPath()
        line.move(to: fromPoint)
        line.addLine(to: toPoint)
        return line
    }
    
    
    func addAnimationLayer() {
        
        createPathOne()
        createPathTwo()
        createPath()
        
        // set Animation Layer design
        animationLayer.fillColor = UIColor.clear.cgColor
        animationLayer.strokeColor = UIColor.white.cgColor
        animationLayer.lineWidth = 8.0
        animationLayer.path = path.cgPath
        layer.addSublayer(animationLayer)
        expand1()
        Timer.scheduledTimer(timeInterval: 10.0, target: self, selector: #selector(expand1), userInfo: nil, repeats: true)
    }
    @objc func expand1() {
        
        let expandAnimation: CABasicAnimation = CABasicAnimation(keyPath: "position")
        expandAnimation.fromValue = [0,0]
        expandAnimation.toValue = [-2000,0]
        expandAnimation.duration = 10.0
        expandAnimation.fillMode = CAMediaTimingFillMode.forwards
        expandAnimation.isRemovedOnCompletion = false
        animationLayer.add(expandAnimation, forKey: nil)
    }
    func expand() {
        animationLayer.path = centerMainLine.cgPath
        if animationDirection{
            
            let expandAnimation: CABasicAnimation = CABasicAnimation(keyPath: "path")
            expandAnimation.fromValue = path1.cgPath
            expandAnimation.toValue = path2.cgPath
            expandAnimation.duration = animationDuration
            expandAnimation.fillMode = CAMediaTimingFillMode.backwards
            expandAnimation.isRemovedOnCompletion = false
            animationLayer.add(expandAnimation, forKey: nil)
            
            animationDirection = false
        }
        else{
            let expandAnimation: CABasicAnimation = CABasicAnimation(keyPath: "path")
            expandAnimation.fromValue = path2.cgPath
            expandAnimation.toValue = path1.cgPath
            expandAnimation.duration = animationDuration
            expandAnimation.fillMode = CAMediaTimingFillMode.forwards
            expandAnimation.isRemovedOnCompletion = false
            animationLayer.add(expandAnimation, forKey: nil)
            
            animationDirection = true
        }
    }
    
    func createPathOne(){
        
        path1.append(upLeftCircle);
        path1.append(centerMainLine);
        path1.append(downRightCircle)
        
    }
    func createPathTwo(){
        path2.append(downLeftCircle);
        path2.append(centerMainLine);
        path2.append(upRightCircle)
    }
    
    func createPath()  {
        let frameSize = self.frame.size;
        
        let lineHeight1 : CGFloat = 30
        let lineHeight2 : CGFloat = 20
        
        let radius1 : CGFloat = 40.0
        let radius2 : CGFloat = 20.0
        
        var lastPoint : CGPoint = CGPoint(x:0.0,y:frameSize.height/2 - lineHeight1/2)
        for i in 1...10{
            
            let p1 = drawUpCircle(centerPoint: CGPoint(x: lastPoint.x + radius1, y: lastPoint.y  ), radiusValue: radius1)
            lastPoint = p1.currentPoint;
            
            let p2 = drawLine(fromPoint: lastPoint , toPoint: CGPoint(x:lastPoint.x, y: lastPoint.y+lineHeight1))
            lastPoint = p2.currentPoint;
            
            let p3 = drawDownCircle(centerPoint: CGPoint(x:lastPoint.x + radius1, y: lastPoint.y), radiusValue: radius1)
            lastPoint = p3.currentPoint;
            
            let p4 = drawLine(fromPoint: lastPoint, toPoint: CGPoint(x:lastPoint.x, y: lastPoint.y - lineHeight2))
            lastPoint = p4.currentPoint;
            
            let p5 = drawUpCircle(centerPoint: CGPoint(x:lastPoint.x + radius2, y: lastPoint.y), radiusValue: radius2)
            lastPoint = p5.currentPoint;
            
            let p6 = drawLine(fromPoint: lastPoint, toPoint: CGPoint(x:lastPoint.x, y: lastPoint.y + lineHeight2))
            lastPoint = p6.currentPoint;
            
            let p7 = drawDownCircle(centerPoint: CGPoint(x:lastPoint.x + radius2, y: lastPoint.y), radiusValue: radius2)
            lastPoint = p7.currentPoint
            
            let p8  = drawLine(fromPoint: lastPoint, toPoint: CGPoint(x:lastPoint.x, y: lastPoint.y - lineHeight1))
            lastPoint = p8.currentPoint;
            
            path.append(p1)
            path.append(p2)
            path.append(p3)
            path.append(p4)
            path.append(p5)
            path.append(p6)
            path.append(p7)
            path.append(p8)
            
        }
    }
}
