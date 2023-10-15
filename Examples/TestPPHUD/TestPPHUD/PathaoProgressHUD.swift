//
//  PPHUD.swift
//  TestPPHUD
//
//  Created by Muhammad Ariful islam on 8/10/23.
//

import UIKit

enum Style {
    case light
    case dark
}

enum MaskType {
    case clear
    case black
    case gray
    //case custom(UIColor)
}

enum HUDType {
    case show
    case showWithStatus
    case showWithSuccess
    case showWithError
}

struct Config {
    var message: String?
    var loadingImageName: String?
    var successImageName: String?
    var errorImageName: String?
    var showTextColor: UIColor?
    var loadingTextColor: UIColor?
    var successTextColor: UIColor?
    var errorTextColor: UIColor?
    var loaderStyle: Style?
    var loaderBackgroundColor: UIColor?
    var maskType: MaskType?
    var loaderImageWidth: CGFloat?
    var loaderImageHeight: CGFloat?
    var dismissTime: Double?
    var spinnerColor: UIColor?
    var hudType: HUDType?
}

public final class PPHUD {
    class func setup(config: Config?) {
        PathaoProgressHUD.shared.setup(config: config)
    }
    
    class func show(with message: String? = nil, config: Config? = nil) {
        PathaoProgressHUD.shared.show(with: message, config: config)
    }
    
    class func showWithStatus(message: String, config: Config? = nil){
        PathaoProgressHUD.shared.showWithStatus(message: message, config: config)
    }

    class func showSuccessWithStatus(message: String, config: Config? = nil) {
        PathaoProgressHUD.shared.showSuccessWithStatus(message: message, config: config)
    }

    class func showErrorWithStatus(message: String, config: Config? = nil) {
        PathaoProgressHUD.shared.showErrorWithStatus(message: message, config: config)
    }

    class func removeFromTop() {
        PathaoProgressHUD.shared.removeFromTop()
    }

    class func removeAll() {
        PathaoProgressHUD.shared.removeAll()
    }
}

fileprivate final class PathaoProgressHUD {
    
    private var globalConfig = Config()
    private var window: UIWindow?
    static let shared = PathaoProgressHUD()
    
    //MARK: - Init
    private init() {
        setGlobalConfig()
    }
    
    private func setGlobalConfig() {
        var config = Config()
        
        config.showTextColor = .white
        config.loadingTextColor = .white
        config.successTextColor = .white
        config.errorTextColor = .white
        
        config.loaderStyle = .light
        config.loaderBackgroundColor = .white
        config.maskType = .clear
        
        config.loaderImageWidth = 30.0
        config.loaderImageHeight = 30.0
        
        config.dismissTime = 3.0
        config.spinnerColor = .white
        
        setup(config: config)
    }
    
    private func initWindow() {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        
        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
            window?.windowScene = windowScene
        }
    }
    
    //MARK: - Initial setup
    func setup(config: Config?) {
        
        //set image properties
        if let loadingImageName = config?.loadingImageName {
            globalConfig.loadingImageName = loadingImageName
        }
        
        if let successImageName = config?.successImageName {
            globalConfig.successImageName = successImageName
        }
        
        if let errorImageName = config?.errorImageName {
            globalConfig.errorImageName = errorImageName
        }
        
        //set text color properties
        if let showTextColor = config?.showTextColor {
            globalConfig.showTextColor = showTextColor
        }
        
        if let loadingTextColor = config?.loadingTextColor {
            globalConfig.loadingTextColor = loadingTextColor
        }
        
        if let successTextColor = config?.successTextColor {
            globalConfig.successTextColor = successTextColor
        }
        
        if let errorTextColor = config?.errorTextColor {
            globalConfig.errorTextColor = errorTextColor
        }
        
        // set loader properties
        if let loaderStyle = config?.loaderStyle {
            globalConfig.loaderStyle = loaderStyle
        }
        
        if let loaderBackgroundColor = config?.loaderBackgroundColor {
            globalConfig.loaderBackgroundColor = loaderBackgroundColor
        }
        
        if let maskType = config?.maskType {
            globalConfig.maskType = maskType
        }
        
        if let dismissTime = config?.dismissTime {
            globalConfig.dismissTime = dismissTime
        }
        
        // set image properties
        if let loaderImageWidth = config?.loaderImageWidth {
            globalConfig.loaderImageWidth = loaderImageWidth
        }
        
        if let loaderImageHeight = config?.loaderImageHeight {
            globalConfig.loaderImageHeight = loaderImageHeight
        }
        
        // set spinner properties
        if let spinnerColor = config?.spinnerColor {
            globalConfig.spinnerColor = spinnerColor
        }
    }
    
    //MARK: - Show PPHUD
    func show(with message: String? = nil, config: Config? = nil) {
        showHUD(message: message, hudType: .show, config: config)
    }
    
    func showWithStatus(message: String, config: Config? = nil) {
        showHUD(message: message, hudType: .showWithStatus, config: config)
    }
    
    func showSuccessWithStatus(message: String, config: Config? = nil) {
        showHUD(message: message, hudType: .showWithSuccess, config: config)
    }
    
    func showErrorWithStatus(message: String, config: Config? = nil) {
        showHUD(message: message, hudType: .showWithError, config: config)
    }
    
    private func showHUD(message: String?, hudType: HUDType, config: Config?) {
        var hudConfig = Config()
        
        hudConfig.message = message
        hudConfig.loadingImageName = config?.loadingImageName ?? globalConfig.loadingImageName
        hudConfig.successImageName = config?.successImageName ?? globalConfig.successImageName
        hudConfig.errorImageName = config?.errorImageName ?? globalConfig.errorImageName
        hudConfig.showTextColor = config?.showTextColor ?? globalConfig.showTextColor
        hudConfig.loadingTextColor = config?.loadingTextColor ?? globalConfig.loadingTextColor
        hudConfig.successTextColor = config?.successTextColor ?? globalConfig.successTextColor
        hudConfig.errorTextColor = config?.errorTextColor ?? globalConfig.errorTextColor
        hudConfig.loaderStyle = config?.loaderStyle ?? globalConfig.loaderStyle
        hudConfig.loaderBackgroundColor = config?.loaderBackgroundColor ?? globalConfig.loaderBackgroundColor
        hudConfig.maskType = config?.maskType ?? globalConfig.maskType
        hudConfig.loaderImageWidth = config?.loaderImageWidth ?? globalConfig.loaderImageWidth
        hudConfig.loaderImageHeight = config?.loaderImageHeight ?? globalConfig.loaderImageHeight
        hudConfig.dismissTime = config?.dismissTime ?? globalConfig.dismissTime
        hudConfig.spinnerColor = config?.spinnerColor ?? globalConfig.spinnerColor
        hudConfig.hudType = hudType
        
        var ppHUDView: PathaoProgressHUDView!
        ppHUDView = PathaoProgressHUDView(frame: UIScreen.main.bounds, config: hudConfig)
        addPPHUDViewOnWindow(hudView: ppHUDView)
    }
    
    //MARK: - Utils
    private func addPPHUDViewOnWindow(hudView: PathaoProgressHUDView) {
        initWindow()
        hudView.alpha = 0.7
        
        UIView.animate(withDuration: 0.3, delay: 0.0, options: .curveEaseOut) {
            hudView.alpha = 1.0
            self.window?.addSubview(hudView)
        }
    }
    
    func removeFromTop() {
        let lastSubview = self.window?.subviews.last
        if lastSubview is PathaoProgressHUDView {
            lastSubview?.removeFromSuperview()
        }
        self.window = nil
    }
    
    func removeAll() {
        guard let window = self.window else { return }
        for view in window.subviews {
            if view is PathaoProgressHUDView {
                view.removeFromSuperview()
            }
        }
        self.window = nil
    }
}

