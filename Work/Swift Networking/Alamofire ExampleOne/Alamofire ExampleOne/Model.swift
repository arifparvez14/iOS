//
//  Model.swift
//  Alamofire ExampleOne
//
//  Created by SOL iOS Mac Mini on 6/24/19.
//  Copyright © 2019 com.arif. All rights reserved.
//

import Foundation
import ObjectMapper

class Data: Mappable {
    
    var name: String?
    var des: String?
    var courses = [Value]()
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        name <- map["name"]
        des <- map["description"]
        courses <- map["courses"]
    }
}

class Value: Mappable {
    var id: Int?
    var name: String?
    var link: String?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        name <- map["name"]
        link <- map["link"]
    }
    
    
}

