//
//  ViewController.swift
//  FacebookLogIn
//
//  Created by SOL iOS Mac Mini on 3/13/19.
//  Copyright © 2019 com.arif. All rights reserved.
//

import UIKit
import FBSDKLoginKit
import FBSDKCoreKit


class ViewController: UIViewController{

    override func viewDidLoad() {
        super.viewDidLoad()
//        let loginButton = FBSDKLoginButton()
//        view.addSubview(loginButton)
//        loginButton.frame = CGRect(x: 16, y: 50, width: view.frame.width - 32, height: 50)
//        loginButton.delegate = self
    }
    
    func loginButton(_ loginButton: FBSDKLoginButton!, didCompleteWith result: FBSDKLoginManagerLoginResult!, error: Error!) {
        
        
        
//        let request = FBSDKGraphRequest(graphPath: "me", parameters: ["fields":"id,email,name,first_name,last_name,picture.type(large)"], accessToken: FBSDKAccessToken.current, httpMethod: .GET, apiVersion: FacebookCore.GraphAPIVersion.defaultVersion)
//        request.start { (response, result) in
//            switch result {
//            case .success(let value):
//                print(value.dictionaryValue!)
//            case .failed(let error):
//                print(error)
//            }
//        }
//        let request: FBSDKGraphRequest = FBSDKGraphRequest(graphPath: "me", parameters: ["fields":"email,name"], tokenString: FBSDKAccessToken.tokenString, version: nil, HTTPMethod: "GET")
//        request.start { (connection, result, error) in
//            if error  == nil {
//                print("result \(result)")
//            } else {
//                print("error: \(error)")
//            }
//        }
        
    }
    @IBAction func loginButtonTapped(_ sender: Any) {
        let fbManager = FBSDKLoginManager()
        fbManager.logIn(withReadPermissions: ["public_profile","email", "user_gender"], from: self) { (result, error) in
            
            if (error != nil) {
                print("Process error")
            } else if (result?.isCancelled)! {
                print("Cancelled")
            } else {
                print("Logged in")
                guard let fbResult = result else {
                    return
                }
                self.startGraphRequestWith(result: fbResult)
            }
        }
    }
    
    
    func startGraphRequestWith(result: FBSDKLoginManagerLoginResult) {
        let request = FBSDKGraphRequest(graphPath: "me", parameters: ["fields":"id,email,name,first_name,last_name,picture.type(large)"])
        request?.start(completionHandler: { (connection, userInfo, error) in
            guard error == nil, let _userInfo = userInfo as? [String: Any] else {
                print(error?.localizedDescription ?? "")
//                self.showAlertWith("Error", error?.localizedDescription ?? "")
                return
            }
            
//            print("userinfo: ", _userInfo)
            var params = [String : Any]()
            var requestParam = [String:AnyObject]()
            params["facebook_id"] = result.token.userID
            requestParam["facebook_id"] = result.token.userID as AnyObject
            if let firstName = _userInfo["first_name"] as? String {
                params["first_name"] = firstName
            }
            if let lastName = _userInfo["last_name"] as? String {
                params["last_name"] = lastName
            }
            if let gender = _userInfo["gender"] as? String {
                params["gender"] = gender
            }
            if let email = _userInfo["email"] as? String {
                params["email"] = email
                requestParam["email"] = email as AnyObject
            } else {
//                self.showAlertWith("Error", "Facebook Account is created without Email")
                //HUD.flash(.labeledError(title: "Error", subtitle: "Facebook Account is created without Email"), delay: 1.0)
                return
            }
            
            print(params)
        })
    }
}

