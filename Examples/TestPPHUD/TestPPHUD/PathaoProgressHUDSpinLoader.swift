//
//  PathaoProgressHUDSpinLoader.swift
//  TestPPHUD
//
//  Created by Muhammad Ariful islam on 11/10/23.
//

import Foundation

import UIKit

@IBDesignable
class SpinnerView : UIView {
    public var spinnerColor: UIColor = UIColor(hex: "#172FB1") ?? UIColor()
    public var lineWidth: CGFloat = 5

    override var layer: CAShapeLayer {
        get {
            return super.layer as! CAShapeLayer
        }
    }

    override class var layerClass: AnyClass {
        return CAShapeLayer.self
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.fillColor = nil
        layer.strokeColor = UIColor.black.cgColor
        layer.lineWidth = lineWidth
        layer.lineCap = .round
        setPath()
    }

    override func didMoveToWindow() {
        animate()
    }

    private func setPath() {
        layer.path = UIBezierPath(ovalIn: bounds.insetBy(dx: lineWidth / 2,
                                                         dy: lineWidth / 2)).cgPath
    }

    struct Pose {
        let secondsSincePriorPose: CFTimeInterval
        let start: CGFloat
        let length: CGFloat
        init(_ secondsSincePriorPose: CFTimeInterval, _ start: CGFloat, _ length: CGFloat) {
            self.secondsSincePriorPose = secondsSincePriorPose
            self.start = start
            self.length = length
        }
    }

    class var poses: [Pose] {
        get {
            return [
                Pose(0.0, 0.000, 0.7),
                Pose(0.6, 0.500, 0.5),
                Pose(0.6, 1.000, 0.3),
                Pose(0.6, 1.500, 0.1),
                Pose(0.2, 1.875, 0.1),
                Pose(0.2, 2.250, 0.3),
                Pose(0.2, 2.625, 0.5),
                Pose(0.2, 3.000, 0.7),
            ]
        }
    }

    func animate() {
        var time: CFTimeInterval = 0
        var times = [CFTimeInterval]()
        var start: CGFloat = 0
        var rotations = [CGFloat]()
        var strokeEnds = [CGFloat]()

        let poses = type(of: self).poses
        let totalSeconds = poses.reduce(0) { $0 + $1.secondsSincePriorPose }

        for pose in poses {
            time += pose.secondsSincePriorPose
            times.append(time / totalSeconds)
            start = pose.start
            rotations.append(start * 2 * .pi)
            strokeEnds.append(pose.length)
        }

        times.append(times.last!)
        rotations.append(rotations[0])
        strokeEnds.append(strokeEnds[0])

        animateKeyPath(keyPath: "strokeEnd", duration: totalSeconds,
                       times: times, values: strokeEnds)
        animateKeyPath(keyPath: "transform.rotation", duration: totalSeconds,
                       times: times, values: rotations)

        animateStrokeHueWithDuration(duration: totalSeconds * 5)
    }

    func animateKeyPath(keyPath: String, duration: CFTimeInterval,
                        times: [CFTimeInterval], values: [CGFloat]) {
        let animation = CAKeyframeAnimation(keyPath: keyPath)
        animation.keyTimes = times as [NSNumber]?
        animation.values = values
        animation.calculationMode = .linear
        animation.duration = duration
        animation.repeatCount = Float.infinity
        layer.add(animation, forKey: animation.keyPath)
    }

    func animateStrokeHueWithDuration(duration: CFTimeInterval) {
        let count = 36
        let animation = CAKeyframeAnimation(keyPath: "strokeColor")
        animation.keyTimes = (0 ... count).map { NSNumber(value: CFTimeInterval($0) / CFTimeInterval(count)) }
        animation.values = (0 ... count).map {[weak self] _ in
            self?.spinnerColor.cgColor as Any
        }
        animation.duration = duration
        animation.calculationMode = .linear
        animation.repeatCount = Float.infinity
        layer.add(animation, forKey: animation.keyPath)
    }
}


@IBDesignable
public class CircularLoader: UIView {
    
    public override var layer: CAShapeLayer {
        get { return super.layer as! CAShapeLayer }
    }
    
    public override class var layerClass: AnyClass {
        return CAShapeLayer.self
    }

    public var spinnerColor: UIColor = UIColor(hex: "#172FB1") ?? UIColor()
    public var strokeColor: UIColor = UIColor(hex: "#EFF1FF") ?? UIColor()
    public var lineWidth: CGFloat = 5
    private var loader: SpinnerView?
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    func commonInit() {
        NotificationCenter.default.addObserver(self, selector: #selector(appWillResignActive),
                                               name: Notification.Name("applicationWillResignActive"),
                                               object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(appDidBecomeActive),
                                               name: Notification.Name("applicationDidBecomeActive"),
                                               object: nil)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        layer.fillColor = nil
        layer.strokeColor = strokeColor.cgColor
        layer.lineWidth = lineWidth
        layer.path = UIBezierPath(ovalIn: bounds.insetBy(dx: lineWidth / 2,
                                                         dy: lineWidth / 2)).cgPath
    }

    public override func didMoveToWindow() {
        super.didMoveToWindow()
        guard loader == nil else {
            return
        }
        let loader = SpinnerView(frame: bounds)
        loader.lineWidth = lineWidth
        loader.spinnerColor = spinnerColor
        self.loader = loader
        addSubview(loader)
    }
    
    @objc private func appWillResignActive() {
        //loader?.layer.removeAllAnimations()
    }
    
    @objc private func appDidBecomeActive() {
        loader?.layer.removeAllAnimations()
        loader?.animate()
    }
}

