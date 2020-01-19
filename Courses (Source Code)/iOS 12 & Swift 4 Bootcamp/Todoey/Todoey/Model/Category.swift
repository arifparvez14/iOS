//
//  Category.swift
//  Todoey
//
//  Created by SOL MAC 15 on 19/1/20.
//  Copyright © 2020 SOL MAC 15. All rights reserved.
//

import Foundation
import RealmSwift

class Category: Object {
    @objc dynamic var name: String = ""
    let items = List<Items>()
}
