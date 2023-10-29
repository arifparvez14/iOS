//
//  ViewController.swift
//  TestPPHUD
//
//  Created by Muhammad Ariful islam on 8/10/23.
//

import UIKit
import SVProgressHUD

class ViewController: UIViewController {
    
    private let loadingText = "Loading..."
    private let errorText = "Error"
    private let shortText = "Lorem Ipsum is simply dummy text of the printing and typesetting industry."
    private let longText = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book."
    
    private enum SetupMode: String {
        case defaultSetup
        case localSetup
    }
    
    private var setupMode: SetupMode = .defaultSetup
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupMode = .localSetup
        setGlobalConfig()
    }
    
    //MARK: - Global config
    private func setGlobalConfig() {
        var config = Config()
        config.loadingImage = UIImage(named: "info")
        config.successImage = UIImage(named: "success")
        config.errorImage = UIImage(named: "error")
        config.loaderBackgroundColor = .yellow
        config.loaderImageWidth = 50
        config.loaderImageHeight = 50
        config.loadingTextColor = .black
        config.successTextColor = .green
        config.errorTextColor = .red
        config.spinnerColor = .blue
        config.dismissTime = 2.0
        
        PPHUD.setup(config: config)
    }
    
    //MARK: - Default config
    private func defaultShow() {
        PPHUD.show()
    }
    
    private func defaultShowWithText() {
        PPHUD.show(with: loadingText)
    }
    
    private func defaultShowWithStatus() {
        PPHUD.showWithStatus(message: shortText)
    }
    
    private func defaultShowSuccessWithSuccess() {
        PPHUD.showSuccessWithStatus(message: longText)
    }
    
    private func defaultShowErrorWithStatus() {
        PPHUD.showErrorWithStatus(message: errorText)
    }
    
    //MARK: - Local Config
    private func localShow() {
        PPHUD.show(config: Config(loaderBackgroundColor: .gray, spinnerColor: .blue))
    }
    
    private func localShowWithText() {
        PPHUD.show(with: "Local Config", config: Config(loaderBackgroundColor: .red))
    }
    
    private func localShowWithStatus() {
        var config = Config()
        config.loadingImage = UIImage(named: "info")
        config.loaderBackgroundColor = .gray
        PPHUD.showWithStatus(message: "Local show with status", config: config)
    }
    
    private func localShowSuccessWithSuccess() {
        var config = Config()
        config.successImage = UIImage(named: "success")
        config.loaderImageWidth = 100
        config.loaderImageHeight = 100
        config.loaderBackgroundColor = .cyan
        PPHUD.showSuccessWithStatus(message: "Local show with success", config: config)
    }
    
    private func localShowErrorWithStatus() {
        var config = Config()
        config.errorImage = UIImage(named: "error")
        config.loaderImageWidth = 50
        config.loaderImageHeight = 50
        config.loaderBackgroundColor = .white
        PPHUD.showErrorWithStatus(message: "Local show with error", config: config)
    }
    
    //MARK: - IBActions
    @IBAction func show(_ sender: Any) {
        setupMode == .defaultSetup ? defaultShow(): localShow()
    }
    
    @IBAction func showWithText(_ sender: Any) {
        setupMode == .defaultSetup ? defaultShowWithText(): localShowWithText()
    }
    
    @IBAction func showWithStatus(_ sender: Any) {
        setupMode == .defaultSetup ? defaultShowWithStatus(): localShowWithStatus()
    }
    
    @IBAction func showSuccessWithStatus(_ sender: Any) {
        setupMode == .defaultSetup ? defaultShowSuccessWithSuccess(): localShowSuccessWithSuccess()
    }
    
    @IBAction func showErrorWithStatus(_ sender: Any) {
        setupMode == .defaultSetup ? defaultShowErrorWithStatus(): localShowErrorWithStatus()
    }
    
    

    
    func testSVProgressHUD() {
        //SVProgressHUD.setBackgroundColor(.gray)
        SVProgressHUD.setDefaultStyle(.dark)
        //SVProgressHUD.setDefaultStyle(.light)
        //SVProgressHUD.showInfo(withStatus: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.")
        SVProgressHUD.show()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 10.0) {
            SVProgressHUD.dismiss()
            //SVProgressHUD.show()
        }
    }
}

