//
//  ViewController.swift
//  RequestAndResponse
//
//  Created by SOL iOS Mac Mini on 4/4/19.
//  Copyright © 2019 com.arif. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    @IBAction func submitButtonTapped(_ sender: Any) {
        let params = ["email":emailField.text ,
                      "password":passwordField.text,
                      "type":1] as [String : Any]
        
        var request = URLRequest(url: URL(string: "http://52.89.78.9/api/public/v1/user/registration")!)
        request.httpMethod = "POST"
        request.httpBody = try? JSONSerialization.data(withJSONObject: params, options: [])
        request.addValue("0123456789", forHTTPHeaderField: "X-KANDIID-TOKEN")
        
        //request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard let data = data else {return}
            print(data)
            
        let decoder = JSONDecoder()
            do {let res = try decoder.decode(DataResponse.self, from: data)
            print(res)
            //print(res.resultCode)
            }catch{
                print(error)
            }
        }
        task.resume()
    }
}

