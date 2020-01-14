//
//  ViewController.swift
//  ParsingDataUsingJson
//
//  Created by SOL iOS Mac Mini on 4/4/19.
//  Copyright © 2019 com.arif. All rights reserved.
//

import UIKit

struct WebsiteDescription: Decodable {
    let name: String
    let description: String
    let courses: [Course]
}

struct Course: Decodable {
    let id: Int
    let name: String
    let link : String
    let imageUrl: String
    
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let urlString = "https://api.letsbuildthatapp.com/jsondecodable/website_description"
        guard let url = URL(string: urlString) else {return}
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            guard let data = data else { return }
            
         do{
            let websitedes = try JSONDecoder().decode(WebsiteDescription.self, from: data)
            print(websitedes.name)
         }catch let jsonErr { print(jsonErr)}
            
        }.resume()
    }
}

