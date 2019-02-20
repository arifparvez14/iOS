//
//  ViewController.swift
//  AlamofireSwiftyJSONSample
//
//  Created by SOL iOS Mac Mini on 2/20/19.
//  Copyright © 2019 com.arif. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import ObjectMapper

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Response Handler
       
        Alamofire.request("https://httpbin.org/get").response { response in
             print("----------Request Handler----------\n")
            print("Request: \(response.request)")
            print("Response: \(response.response)")
            print("Error: \(response.error)")
            
            if let data = response.data, let utf8Text = String(data: data, encoding: .utf8) {
                print("Data: \(utf8Text)")
            }
        }
        
        
        Alamofire.request("https://httpbin.org/get").responseData { response in
            print("----------Request Data Handler----------\n")
            debugPrint("All Response Info: \(response)")
            
            if let data = response.result.value, let utf8Text = String(data: data, encoding: .utf8) {
                print("Data: \(utf8Text)")
            }
        }
        
        Alamofire.request("https://httpbin.org/get").responseString { response in
            print("----------Request String Handler----------\n")
            print("Success: \(response.result.isSuccess)")
            print("Response String: \(String(describing: response.result.value))")
        }
        
        Alamofire.request("https://httpbin.org/get").responseJSON { response in
            print("----------Request Debug Handler----------\n")
            debugPrint(response)
            
            if let json = response.result.value {
                print("JSON: \(json)")
            }
        }
        
        Alamofire.request("https://httpbin.org/get")
            .responseString { response in
                print("----------Chained Response Handlers----------\n")
                print("Response String: \(response.result.value)")
            }
            .responseJSON { response in
                print("Response JSON: \(response.result.value)")
        }
    }

}



