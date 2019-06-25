//
//  ViewController.swift
//  Json Parsing Basic
//
//  Created by SOL iOS Mac Mini on 6/24/19.
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
    let link: String
    let imageUrl: String
    
//    init(json: [String: Any]) {
//        id = json["id"] as? Int ?? -1
//        name = json["name"] as? String ?? ""
//        link = json["link"] as? String ?? ""
//        imageUrl = json["imageUrl"] as? String ?? ""
//    }
}

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        let myCourse = Course(id: 1, name: "Arif", link: "No Link", imageUrl: "No URL")
//        print(myCourse)
        
        //Take the json and convert into String
        let jsonURL = "https://api.letsbuildthatapp.com/jsondecodable/website_description"
        guard let url = URL(string: jsonURL) else {return}
        
        //Make the request
        URLSession.shared.dataTask(with: url){ (data, response, err) in
            
        //Get Data as String
        guard let data = data else { return }
            
        let dataString = String(data: data, encoding: .utf8)
        print(dataString)
        
            do {
                
                //<--------- Map data using decoder --> don't need any constructor or anythings --------->
                
                //For class Website Description
                let websiteDesc = try
                      JSONDecoder().decode(WebsiteDescription.self, from: data)
                      print(websiteDesc.name)
                
                //For class Course
//                let courses = try
//                    JSONDecoder().decode([Course].self, from: data)
//                    print(courses)
                
                //<---------  Map Data Use jsonSerialization in swift 2/3/Objective-C. Need Constractor for this --------->
                
//                let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers)
//                print(json)
//                let course = Course(json: json as! [String : Any])
//                print(course.name)
                
            } catch let jsonErr {
                print("Error:",jsonErr)
            }
            
            
        }.resume()
        
    }
}



