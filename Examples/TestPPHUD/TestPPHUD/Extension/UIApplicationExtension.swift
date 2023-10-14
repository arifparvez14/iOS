//
//  UIApplicationExtension.swift
//  TestPPHUD
//
//  Created by Muhammad Ariful islam on 9/10/23.
//

import UIKit

extension UIApplication {
    /// The app's key window.
    var keyWindowInConnectedScenes: UIWindow? {
        let windowScenes: [UIWindowScene] = connectedScenes.compactMap({ $0 as? UIWindowScene })
        let windows: [UIWindow] = windowScenes.flatMap({ $0.windows })
        return windows.first(where: { $0.isKeyWindow })
    }
}
