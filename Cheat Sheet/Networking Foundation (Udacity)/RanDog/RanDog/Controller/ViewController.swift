//
//  ViewController.swift
//  RanDog
//
//  Created by SOL iOS Mac Mini on 4/3/19.
//  Copyright © 2019 com.arif. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let randomImageEndPoint = DogAPI.EndPoint.randomImageFromDogsCollection.url
        let task = URLSession.shared.dataTask(with: randomImageEndPoint) { (data
            , response, error) in
            guard let data = data else{
                return
            }
            print(data)
            
            //Using JSONSerialization
            
            /*do {
                let json = try JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
                let url = json["message"] as! String
                print(url)
            }catch {
                print(error)
            }*/
            
            //Using JSONDecoder
            let decoder = JSONDecoder()
                let imageData = try! decoder.decode(DogImage.self, from: data)
                print(imageData)
                
                guard let imageURL = URL (string: imageData.message) else {return}
                
                DogAPI.requestImageFile(url: imageURL, completionHandler: { (image, error) in
                    DispatchQueue.main.async {
                        self.imageView.image = image
                    }
                })
            
        }
        task.resume()
    }
}

