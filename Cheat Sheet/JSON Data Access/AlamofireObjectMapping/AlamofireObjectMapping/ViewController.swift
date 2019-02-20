//
//  ViewController.swift
//  AlamofireObjectMapping
//
//  Created by SOL iOS Mac Mini on 2/20/19.
//  Copyright © 2019 com.arif. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import ObjectMapper

class ViewController: UIViewController {
    
    
    @IBOutlet weak var labelOne: UILabel!
    @IBOutlet weak var labelTwo: UILabel!
    @IBOutlet weak var labelThree: UILabel!
    @IBOutlet weak var labelFour: UILabel!
    @IBOutlet weak var labelFive: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Alamofire.request("https://api.letsbuildthatapp.com/jsondecodable/course").responseJSON{ response in
            print("----------Request Debug Handler----------\n")
            if let json = response.result.value {
                print("JSON: \(json)")
                let course = Mapper<Course>().map(JSON: json as! [String : Any])
                if let c = course, let id = c.id, let name = c.name {
                    print(id)
                    print(name)
                } else {
                    print("course/id not found")
                }
                print(course!.link!)
                print(course!.imageUrl!)
                print(course!.number_of_lessons!)
                self.labelOne.text = String(course!.id!)
                self.labelTwo.text = course!.name!
                self.labelThree.text = course!.link!
                self.labelFour.text = course!.imageUrl!
                self.labelFive.text = String(course!.number_of_lessons!)
            }
        }
        
    }
}

struct Course: Mappable{
    var id: Int?
    var name: String?
    var link: String?
    var imageUrl: String?
    var number_of_lessons: Int?
    
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        id <- map["id"]
        name <- map["name"]
        link <- map["link"]
        imageUrl <- map["imageUrl"]
        number_of_lessons <- map["number_of_lessons"]
    }
}

