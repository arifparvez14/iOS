//
//  ViewController.swift
//  Alamofire ExampleOne
//
//  Created by SOL iOS Mac Mini on 6/24/19.
//  Copyright © 2019 com.arif. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        APICall()
        APICall2()
    }
    
    func APICall()
    {
        Alamofire.request("https://api.letsbuildthatapp.com/jsondecodable/website_description").responseString {
            response in
            
            switch(response.result){
            case .success(let responseString):
                print(responseString)
                let dataResponse = Data(JSONString: "\(responseString)")!
                print(dataResponse.des)
            case .failure(let error):
                print(error)
            }
            
            if response.result.isSuccess {
                print("Yes")
            }
        }
    }
    
    func APICall2()
    {
        Alamofire.request("https://api.letsbuildthatapp.com/jsondecodable/website_description").responseData {
            response in
            
            if let JSON = response.result.value, let utf8Text = String(data: JSON, encoding: .utf8){
                print("Data: \(utf8Text)")
            }
        }
        
        Alamofire.request("https://api.letsbuildthatapp.com/jsondecodable/website_description").responseString {
            response in
            print("Success:\(response.result.isSuccess)")
        }
    }
}

