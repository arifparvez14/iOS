//
//  ViewController.swift
//  JSONParseLBTA
//
//  Created by Sharetrip-iOS on 21/07/2020.
//  Copyright © 2020 AP. All rights reserved.
//

import UIKit

struct WebsiteDescription: Decodable{
    let name: String
    let description: String
    let courses: [Course]
}

struct Course: Decodable {
    let id: Int
    let name: String
    let link: String
    let imageUrl: String

    /*init(json: [String: Any]) {
        id = json["id"] as? Int ?? -1
        name = json["name"] as? String ?? ""
        link = json["link"] as? String ?? ""
        imageUrl = json["imageUrl"] as? String ?? ""
    }*/

}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        //let jsonUrlString = "https://api.letsbuildthatapp.com/jsondecodable/course"
        let jsonUrlString = "https://api.letsbuildthatapp.com/jsondecodable/website_description"
        guard let url = URL(string: jsonUrlString) else {return}

        URLSession.shared.dataTask(with: url) { (data, response, err) in
            guard let data = data else {return}

            //Convert data to string
            let dataAsString = String(data: data, encoding: .utf8)
            //print(dataAsString as Any)

            //Convert data to json object
            do{

                //Swift 4
                //let course = try JSONDecoder().decode(Course.self, from: data) //For link 1
                //let courses = try JSONDecoder().decode([Course].self, from: data) //For link 2
                _ = try JSONDecoder().decode(WebsiteDescription.self, from: data) //For link 3

                //parase in swift 2/3/ objC
                /*guard let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String: Any] else {return}

                let course = Course(json: json)
                print(course.name)*/

            } catch let jsonError{
                print("Json serialization error", jsonError)
            }


        }.resume()
    }

}

