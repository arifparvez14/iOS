//
//  ViewController.swift
//  RealminSwift
//
//  Created by SOL iOS Mac Mini on 6/24/19.
//  Copyright © 2019 com.arif. All rights reserved.
//

import UIKit
import RealmSwift

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let realm = try! Realm()
        
        print(Realm.Configuration.defaultConfiguration.fileURL)
        
          //Save data in Realm Database
//        var myCat = Cat()
//        myCat.name = "Joe"
//        myCat.gender = "Male"
//        myCat.color = "Orange"
//
//        try! realm.write {
//            realm.add(myCat)
//        }
        
        // Find the whole result set
//        let result = realm.objects(Cat.self)
//        for name in result {
//            print(name)
//        }
//        print(result[0].name)
        
        //Find a specific attribute
        let result = realm.objects(Cat.self).filter("color = 'Orange'")
        print(result.count)
    }
}

