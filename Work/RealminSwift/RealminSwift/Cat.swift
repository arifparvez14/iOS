//
//  Cat.swift
//  RealminSwift
//
//  Created by SOL iOS Mac Mini on 6/25/19.
//  Copyright © 2019 com.arif. All rights reserved.
//

import Foundation
import RealmSwift

class Cat: Object {
    @objc dynamic var name: String?
    @objc dynamic var gender: String?
    @objc dynamic var color: String?
}
