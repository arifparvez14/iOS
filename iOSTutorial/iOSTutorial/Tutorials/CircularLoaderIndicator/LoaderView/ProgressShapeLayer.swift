//
//  File.swift
//  CircularLoadingIndicator
//

/*
/// Create a circular shape using "CAShapeLayer"


 - strokeColor: defines the color of the path
 - lineWidth: determines the width of the path
 - fillColor: defines the color of the area that the circular path encloses
 - lineCap: is set to .round to make the path rounded on both edges
 */

import UIKit

class ProgressShapeLayer: CAShapeLayer {

    public init(strokeColor: UIColor, lineWidth: CGFloat) {
        super.init()
        self.strokeColor = strokeColor.cgColor
        self.lineWidth = lineWidth
        self.fillColor = UIColor.clear.cgColor
        self.lineCap = .round
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
