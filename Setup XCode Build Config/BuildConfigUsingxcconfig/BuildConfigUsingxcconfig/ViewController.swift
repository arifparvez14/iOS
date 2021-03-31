//
//  ViewController.swift
//  BuildConfigUsingxcconfig
//
//  Created by Sharetrip-iOS on 31/03/2021.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        print(infoForKey("Backend Url") ?? "")
    }

    func infoForKey(_ key: String) -> String? {
        return (Bundle.main.infoDictionary?[key] as? String)?
                .replacingOccurrences(of: "\\", with: "")
     }

}

