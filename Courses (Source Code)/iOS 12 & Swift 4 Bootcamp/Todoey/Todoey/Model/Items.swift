//
//  Items.swift
//  Todoey
//
//  Created by SOL MAC 15 on 19/1/20.
//  Copyright © 2020 SOL MAC 15. All rights reserved.
//

import Foundation
import RealmSwift

class Items: Object {
    @objc dynamic var title: String = ""
    @objc dynamic var done: Bool = false
    var parentCategory = LinkingObjects(fromType: Category.self, property: "items")
}
