//
//  ActivityIndicatorView.swift
//  CircularLoader
//

import UIKit

public final class ActivityIndicatorView: UIView {

    public var color: UIColor = UIColor.white
    public var padding: CGFloat = 0
    public var lineWidth: CGFloat = 0

    public var animating: Bool { return isAnimating }
    private(set) public var isAnimating: Bool = false

    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        backgroundColor = UIColor.clear
        isHidden = true
    }

    public init(frame: CGRect, color: UIColor, padding: CGFloat, lineWidth: CGFloat) {
        self.color = color
        self.padding = padding
        self.lineWidth = lineWidth
        super.init(frame: frame)
        isHidden = true
    }

    public override var bounds: CGRect {
        didSet {
            if oldValue != bounds && isAnimating {
                setUpAnimation()
            }
        }
    }

    public final func startAnimating() {
        guard !isAnimating else {
            return
        }
        isHidden = false
        isAnimating = true
        layer.speed = 1
        setUpAnimation()
    }

    public final func stopAnimating() {
        guard isAnimating else {
            return
        }
        isHidden = true
        isAnimating = false
        layer.sublayers?.removeAll()
    }

    private final func setUpAnimation() {
        let animation = ActivityIndicatorCircleStrokeSpin()
        
        var animationRect = frame.inset(by: UIEdgeInsets(top: padding, left: padding, bottom: padding, right: padding))
        let minEdge = min(animationRect.width, animationRect.height)

        layer.sublayers = nil
        animationRect.size = CGSize(width: minEdge, height: minEdge)
        animation.setUpAnimation(in: layer, size: animationRect.size, color: self.color, lineWidth: self.lineWidth)
    }
}
