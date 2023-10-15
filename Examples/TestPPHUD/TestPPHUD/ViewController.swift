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
        config.loaderStyle = .light
        PPHUD.setup(config: config)
    }
    
    func testSVProgressHUD() {
        //SVProgressHUD.setBackgroundColor(.gray)
        SVProgressHUD.setDefaultStyle(.light)
        //SVProgressHUD.setBackgroundColor(.red)
        
        //SVProgressHUD.setDefaultStyle(.light)
        //SVProgressHUD.showInfo(withStatus: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.")
        SVProgressHUD.show()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 10.0) {
            SVProgressHUD.dismiss()
            //SVProgressHUD.show()
        }
    }
    
    
    @IBAction func showStatus(_ sender: Any) {
//        var config = Config()
//        config.loaderBackgroundColor = .black
//        config.spinnerColor = .white
//        //config.loadingTextColor = .white
//        PPHUD.show(with: "Loading...", config: config)
        
        PPHUD.show()
    }
    
    @IBAction func showStatusWithImage(_ sender: Any) {
        var config = Config()
        config.loadingImageName = "info"
        config.loaderImageWidth = 100
        config.loaderImageHeight = 100
        config.loaderBackgroundColor = .gray
        config.dismissTime = 10.0
        PPHUD.showWithStatus(message: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.", config: config)
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
    
    
    @IBAction func showStatusWithSuccess(_ sender: Any) {}
    @IBAction func showStatusWithSuccessImage(_ sender: Any) {}
    @IBAction func showStatusWithSuccessImageBG(_ sender: Any) {}
    @IBAction func showStatusWithError(_ sender: Any) {}
    @IBAction func showStatusWithErrorImage(_ sender: Any) {}
    @IBAction func showStatusWithErrorImageBG(_ sender: Any) {}
    @IBAction func showStatusWithErrorWithCustomTimer(_ sender: Any) {}
    @IBAction func showStatusWithGlobalConfig(_ sender: Any) {}
}

