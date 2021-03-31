//
//  ViewController.swift
//  BuildConfigDemo
//
//  Created by Sharetrip-iOS on 31/03/2021.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        #if DEVELOPMENT
        let SERVER_URL = "http://dev.server.com/api/"
        print(SERVER_URL)
        #else
        let SERVER_URL = "http://prod.server.com/api/"
        print(SERVER_URL)
        #endif
    }


}

