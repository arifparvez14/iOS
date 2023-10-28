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
}

enum HUDType {
    case show
    case showWithStatus
    case showWithSuccess
    case showWithError
}

/// Loader configuration.
/// - Parameter:
///     - message: Loader message
///     - loadingImage: Set status loader image.
///     - successImage: Set success loader image.
///     - errorImage: Set error loader image.
///     - showTextColor: Set spinner loader text color.
///         - default value: .white
///     - loadingTextColor: Set status loader text color.
///         - default value: .white
///     - successTextColor: Set success loader text color.
///         - default value: .white
///     - errorTextColor: Set error loader text color.
///         - default value: .white
///     - loaderStyle: Set loader style (dark or light).
///         - default value: .light
///     - loaderBackgroundColor: Set loader background color.
///         - default value: .white
///     - maskType: Set loader view background color.
///         - default value: .clear
///     - loaderImageWidth: Set loader (status/success/error) image width.
///         - default value: 30
///     - loaderImageHeight: Set loader (status/success/error) image height.
///         - default value: 30
///     - dismissTime: Set success and error loader dismiss time.
///         - default value: 3s
///     - spinnerColor: Set loader (status/success/error) image height.
///         - default value: .white
///

struct Config {
    var message: String?
    var loadingImage: UIImage?
    var successImage: UIImage?
    var errorImage: UIImage?
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
    /// Setup loader global configuration
    ///
    /// - Parameters:
    ///    - config: Loader configurations
    class func setup(config: Config?) {
        PathaoProgressHUD.shared.setup(config: config)
    }
    
    /// Show spinner loader
    ///
    /// Show spinner loader with optional parameter message and configurations.
    /// - If the message is not set, only the spinner loader will show.
    /// - If the config parameter is set, the spinner loader will show with this configuration otherwise loader will show with global configurations.
    ///
    /// - Parameters:
    ///   - message: (Optional) Status message.
    ///   - config: (Optional) Loader configurations.
    class func show(with message: String? = nil, config: Config? = nil) {
        PathaoProgressHUD.shared.show(with: message, config: config)
    }
    
    /// Show status loader with message and configurations
    ///
    /// - If the config parameter is set, the loader will show with this configuration otherwise loader will show with global configurations.
    ///
    /// - Parameters:
    ///   - message: Status message.
    ///   - config: (Optional) Loader configurations.
    class func showWithStatus(message: String, config: Config? = nil){
        PathaoProgressHUD.shared.showWithStatus(message: message, config: config)
    }

    /// Show Success loader with message and configurations
    ///
    /// - If the config parameter is set, the loader will show with this configuration otherwise loader will show with global configurations.
    ///
    /// - Parameters:
    ///   - message: Status message.
    ///   - config: (Optional) Loader configurations.
    class func showSuccessWithStatus(message: String, config: Config? = nil) {
        PathaoProgressHUD.shared.showSuccessWithStatus(message: message, config: config)
    }

    /// Show Error loader with message and configurations
    ///
    /// - If the config parameter is set, the loader will show with this configuration otherwise loader will show with global configurations.
    ///
    /// - Parameters:
    ///   - message: Status message.
    ///   - config: (Optional) Loader configurations.
    class func showErrorWithStatus(message: String, config: Config? = nil) {
        PathaoProgressHUD.shared.showErrorWithStatus(message: message, config: config)
    }

    /// Remove the loader from the view
    class func remove() {
        PathaoProgressHUD.shared.remove()
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
        globalConfig.showTextColor = .white
        globalConfig.loadingTextColor = .white
        globalConfig.successTextColor = .white
        globalConfig.errorTextColor = .white
        
        globalConfig.loaderBackgroundColor = .white
        globalConfig.maskType = .clear
        
        globalConfig.loaderImageWidth = 30.0
        globalConfig.loaderImageHeight = 30.0
        
        globalConfig.dismissTime = 3.0
        globalConfig.spinnerColor = .white
    }
    
    private func initWindow() {
        window = nil
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        
        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
            window?.windowScene = windowScene
        }
    }
    
    //MARK: - Initial setup
    func setup(config: Config?) {
        //map
        
        //set image properties
        if let loadingImage = config?.loadingImage {
            globalConfig.loadingImage = loadingImage
        }
        
        if let successImage = config?.successImage {
            globalConfig.successImage = successImage
        }
        
        if let errorImage = config?.errorImage {
            globalConfig.errorImage = errorImage
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
        hudConfig.loadingImage = config?.loadingImage ?? globalConfig.loadingImage
        hudConfig.successImage = config?.successImage ?? globalConfig.successImage
        hudConfig.errorImage = config?.errorImage ?? globalConfig.errorImage
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
    
    func remove() {
        let lastSubview = self.window?.subviews.last
        if lastSubview is PathaoProgressHUDView {
            lastSubview?.removeFromSuperview()
        }
        window = nil
    }
}

