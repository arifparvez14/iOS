//
//  UIColorExtension.swift
//  TestPPHUD
//
//  Created by Muhammad Ariful islam on 8/10/23.
//

import UIKit

extension UIColor {
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")

        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }

    convenience init(rgb: Int) {
        self.init(
            red: (rgb >> 16) & 0xFF,
            green: (rgb >> 8) & 0xFF,
            blue: rgb & 0xFF
        )
    }

    convenience init?(hex: String) {
        var hexSanitized = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        hexSanitized = hexSanitized.replacingOccurrences(of: "#", with: "")

        var rgb: UInt32 = 0

        var r: CGFloat = 0.0
        var g: CGFloat = 0.0
        var b: CGFloat = 0.0
        var a: CGFloat = 1.0

        let length = hexSanitized.count

        guard Scanner(string: hexSanitized).scanHexInt32(&rgb) else { return nil }

        if length == 6 {
            r = CGFloat((rgb & 0xFF0000) >> 16) / 255.0
            g = CGFloat((rgb & 0x00FF00) >> 8) / 255.0
            b = CGFloat(rgb & 0x0000FF) / 255.0

        } else if length == 8 {
            r = CGFloat((rgb & 0xFF000000) >> 24) / 255.0
            g = CGFloat((rgb & 0x00FF0000) >> 16) / 255.0
            b = CGFloat((rgb & 0x0000FF00) >> 8) / 255.0
            a = CGFloat(rgb & 0x000000FF) / 255.0

        } else {
            return nil
        }

        self.init(red: r, green: g, blue: b, alpha: a)
    }

    convenience init(rgbValue: Int) {
        self.init(red: CGFloat(rgbValue) / 255.0, green: CGFloat(rgbValue) / 255.0, blue: CGFloat(rgbValue) / 255.0, alpha: 1.0)
    }

    class func loaderBlackBackgroundColor() -> UIColor {
        return UIColor.init(red: 0 / 255, green: 0 / 255, blue: 0 / 255, alpha: 0.5)
    }
    
    class func loaderCustomBackgroundColor() -> UIColor {
        return UIColor.init(red: 46 / 255, green: 46 / 255, blue: 46 / 255, alpha: 1)
    }
    
    class func loaderGrayBackgroundColor() -> UIColor {
        return UIColor.init(red: 128 / 255, green: 128 / 255, blue: 128 / 255, alpha: 0.5)
    }

}
