//
//  ViewController.swift
//  TestPPHUD
//
//  Created by Muhammad Ariful islam on 8/10/23.
//

import UIKit
import SVProgressHUD

class ViewController: UIViewController, Storyboarded {

    var window = UIApplication.shared.keyWindowInConnectedScenes ?? UIWindow()
    var viewTag = 100
    var ppHUDView: PathaoProgressHUDView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //testSVProgressHUD()
        //loader.lineWidth = 5.0
        
        var config = Config()
        config.loaderBackgroundColor = .gray
        PPHUD.setup(config: config)
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
    
    
    @IBAction func showStatus(_ sender: Any) {
        var config = Config()
        config.loaderBackgroundColor = .black
        config.spinnerColor = .white
        PPHUD.show(config: config)
    }
    
    @IBAction func showStatusWithImage(_ sender: Any) {
        var config = Config()
        config.loadingImageName = "info"
        PPHUD.showWithStatus(message: "AMmksmskmskmsmksmkkmskmsmksmkkmskmskmskmskmskmskmskmskms", config: config)
    }
    
    
    @IBAction func showSTatusWithImageAndBG(_ sender: Any) {
//        var config = Config()
//        config.loaderBackgroundColor = .gray
//        config.spinnerColor = .red
//        PPHUD.show(config: config)
        
        var config = Config()
        //config.loaderBackgroundColor = .gray
        config.spinnerColor = .red
        config.loaderBackgroundColor = .black
        config.showTextColor = .white
        //config.maskType = .black
        
        PPHUD.setup(config: config)
        PPHUD.show(with: "Loading...")
        //PPHUD.show()
    }
    
    
    @IBAction func showStatusWithSuccess(_ sender: Any) {
//        PathaoProgressHUD.shared.showSuccessWithStatus(
//            messageText: "Success",
//            successImageName: nil,
//            successTextColor: nil,
//            loaderBackgroundColor: nil,
//            loaderStyle: nil,
//            maskType: .clear,
//            dismissTime: nil,
//            loaderImageWidth: nil,
//            loaderImageHeight: nil)
    }
    
    
    @IBAction func showStatusWithSuccessImage(_ sender: Any) {
//        PathaoProgressHUD.shared.showSuccessWithStatus(
//            messageText: "Success",
//            successImageName: "success",
//            successTextColor: .green,
//            loaderBackgroundColor: nil,
//            loaderStyle: nil,
//            maskType: .clear,
//            dismissTime: nil,
//            loaderImageWidth: 10.0,
//            loaderImageHeight: 10.0)
    }
    
    @IBAction func showStatusWithSuccessImageBG(_ sender: Any) {
//        PathaoProgressHUD.shared.showSuccessWithStatus(
//            messageText: "Success",
//            successImageName: "success",
//            successTextColor: .yellow,
//            loaderBackgroundColor: .gray,
//            loaderStyle: nil,
//            maskType: .clear,
//            dismissTime: 5.0,
//            loaderImageWidth: nil,
//            loaderImageHeight: nil)
    }
    
    
    @IBAction func showStatusWithError(_ sender: Any) {
//        PathaoProgressHUD.shared.showErrorWithStatus(
//            messageText: "Error",
//            errorImageName: nil,
//            errorTextColor: nil,
//            loaderBackgroundColor: nil,
//            loaderStyle: nil,
//            maskType: .clear,
//            dismissTime: nil,
//            loaderImageWidth: nil,
//            loaderImageHeight: nil)
    }
    
    @IBAction func showStatusWithErrorImage(_ sender: Any) {
//        PathaoProgressHUD.shared.showErrorWithStatus(
//            messageText: "Error",
//            errorImageName: "error",
//            errorTextColor: .red,
//            loaderBackgroundColor: nil,
//            loaderStyle: nil,
//            maskType: .clear,
//            dismissTime: 5.0,
//            loaderImageWidth: 30.0,
//            loaderImageHeight: 30.0)
    }
    
    @IBAction func showStatusWithErrorImageBG(_ sender: Any) {
//        PathaoProgressHUD.shared.showErrorWithStatus(
//            messageText: "Error",
//            errorImageName: "error",
//            errorTextColor: .cyan,
//            loaderBackgroundColor: .gray,
//            loaderStyle: nil,
//            maskType: .clear,
//            dismissTime: nil,
//            loaderImageWidth: 10.0,
//            loaderImageHeight: 10.0)
    }
    
    @IBAction func showStatusWithErrorWithCustomTimer(_ sender: Any) {
//        PathaoProgressHUD.shared.showErrorWithStatus(
//            messageText: "Error",
//            errorImageName: "error",
//            errorTextColor: .magenta,
//            loaderBackgroundColor: nil,
//            loaderStyle: nil,
//            maskType: .clear,
//            dismissTime: 2.0,
//            loaderImageWidth: 10.0,
//            loaderImageHeight: 10.0)
    }
    
    @IBAction func showStatusWithGlobalConfig(_ sender: Any) {
        //PathaoProgressHUD.shared.setupLoader(successTextColor: .orange, loaderBackgroundColor: .gray, dismissTime: 5.0)
//        PathaoProgressHUD.shared.showSuccessWithStatus(
//            messageText: "Success",
//            successImageName: "success",
//            successTextColor: nil,
//            loaderBackgroundColor: nil,
//            loaderStyle: nil,
//            maskType: .clear,
//            dismissTime: nil,
//            loaderImageWidth: 10.0,
//            loaderImageHeight: 10.0)
        
    }
}

