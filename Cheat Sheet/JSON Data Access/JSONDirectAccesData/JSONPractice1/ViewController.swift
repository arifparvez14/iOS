//
//  ViewController.swift
//  JSONPractice1
//
//  Created by SOL iOS Mac Mini on 2/19/19.
//  Copyright © 2019 com.arif. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = URL(string: "https://samples.openweathermap.org/data/2.5/weather?q=London,uk&appid=b1b15e88fa797225412429c1c50c122a1")
        let task = URLSession.shared.dataTask(with: url!) { (data, response, error) in
            if error != nil  {
                
            } else
            {
                if let content = data
                {
                    do
                    {
                        let myJSON = try JSONSerialization.jsonObject(with: content, options: JSONSerialization.ReadingOptions.mutableContainers) as AnyObject
                        if let sysinfo = myJSON["sys"] as? NSDictionary
                        {
                            if let country = sysinfo["country"]
                            {
                                print(country)
                            }
                        }
                    }
                    catch
                    {
                        print("Not Found")
                    }
                }
            }
        }
        task.resume()
    }


}

