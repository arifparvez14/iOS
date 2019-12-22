//
//  PostData.swift
//  H4X0R
//
//  Created by SOL MAC 15 on 27/11/19.
//  Copyright © 2019 SOL MAC 15. All rights reserved.
//

import Foundation

struct Results: Decodable {
    let hits: [Post]
}
struct Post: Decodable, Identifiable {
    var id: String {
        return objectID
    }
    let objectID: String
    let title: String
    let points: Int
    let url: String?
}
