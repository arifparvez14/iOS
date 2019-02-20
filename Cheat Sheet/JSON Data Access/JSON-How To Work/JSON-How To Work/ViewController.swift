//
//  ViewController.swift
//  JSON-How To Work
//
//  Created by SOL iOS Mac Mini on 2/19/19.
//  Copyright © 2019 com.arif. All rights reserved.
//

import UIKit

struct WebsiteDescription: Decodable {
    let name: String
    let description: String
    let courses: [Course]
}

struct Course: Decodable{
    let id: Int?
    let name: String?
    let link: String?
    let imageUrl: String?
    
//    Nedden for Swift 2/3/ObjC
    
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
        
        //        let myCourse = Course(id: 1, name: "My Course", link: "Some Link", imageUrl: "Empty image")
        
//        let jsonUrlString = "https://api.letsbuildthatapp.com/jsondecodable/course"
//        let jsonUrlString = "https://api.letsbuildthatapp.com/jsondecodable/courses"
//          let jsonUrlString = "https://api.letsbuildthatapp.com/jsondecodable/website_description"
          let jsonUrlString = "https://api.letsbuildthatapp.com/jsondecodable/courses_missing_fields" //Worked when Cpurse all are optional. IT is optional now
        
        guard let url = URL(string: jsonUrlString) else {return}
        URLSession.shared.dataTask(with: url) { (data,response,err) in
            
            guard let data = data else {return}
            
            //            let dataAsString = String(data: data, encoding: .utf8)
            //            print(dataAsString)
            
            do{
                //Swift4
                
                //For Single Array
//                let course = try JSONDecoder().decode(Course.self, from: data)
//                print(course.name)
        
                //For Multiple Array
                let courses = try JSONDecoder().decode([Course].self, from: data)
                print(courses)
                
                //For Multiple Array with two headline
//                let websiteDescription = try JSONDecoder().decode(WebsiteDescription.self, from: data)
//                print(websiteDescription.name, websiteDescription.description)
                
                
                //Swift 2/3/ObjC
//                guard let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String: Any] else { return}
//                let course = Course(json: json)
//                print(course.name)
                
            } catch let jsonErr{
                print("Json Error:",jsonErr)
            }
        }.resume()
    }
}

