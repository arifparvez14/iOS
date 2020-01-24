//
//  DataResponse.swift
//  RequestAndResponse
//
//  Created by SOL iOS Mac Mini on 4/4/19.
//  Copyright © 2019 com.arif. All rights reserved.
//

import Foundation

struct DataResponse: Decodable {
    let resultCode: String
    let time: String
    let data: [Data]
    let executionTime: String
    
}
struct Data: Decodable{
    let user: [UserInfo]
}

struct UserInfo: Decodable {
    let id: Int?
    let email: String?
    let profile_image: String?
    let gender: String?
    let name: String?
    let personal_info: String?
    let latitude: Double?
    let longitude: Double?
    let push_token: String?
}
