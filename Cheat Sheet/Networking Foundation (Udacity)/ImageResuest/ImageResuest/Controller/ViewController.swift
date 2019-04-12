//
//  ViewController.swift
//  ImageResuest
//
//  Created by SOL iOS Mac Mini on 4/3/19.
//  Copyright © 2019 com.arif. All rights reserved.
//

import UIKit

enum KittenImageLocation: String {
    
    case http = "http://www.kittenswhiskers.com/wp-content/uploads/sites/23/2014/02/Kitten-playing-with-yarn.jpg"
    case https = "https://upload.wikimedia.org/wikipedia/commons/thumb/0/06/Kitten_in_Rizal_Park%2C_Manila.jpg/460px-Kitten_in_Rizal_Park%2C_Manila.jpg"
    case error = "not a url"
}

class ViewController: UIViewController {

    @IBOutlet weak var ImageView: UIImageView!
    
    let imageLocation = KittenImageLocation.http.rawValue
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func handleShowHideImage(_ sender: Any) {
        guard let imageURL = URL(string: imageLocation) else {
            print("Cannot create URL")
            return
        }
        let task = URLSession.shared.dataTask(with: imageURL) { (data, response, error)
            in
            guard let data = data else{
                print("no data, or there was en error")
                return
            }
            let downloadImage = UIImage(data: data)
            DispatchQueue.main.async {
                 self.ImageView.image =  downloadImage
            }
           
        }
        task.resume()
    }
    
}

