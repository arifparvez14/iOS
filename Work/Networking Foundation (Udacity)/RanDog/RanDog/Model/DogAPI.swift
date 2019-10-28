//
//  DogAPI.swift
//  RanDog
//
//  Created by SOL iOS Mac Mini on 4/3/19.
//  Copyright © 2019 com.arif. All rights reserved.
//

import Foundation
import UIKit

class DogAPI {
    enum EndPoint: String {
        case randomImageFromDogsCollection = "https://dog.ceo/api/breeds/image/random"
        
        var url: URL {
            return URL (string: self.rawValue)!
        }
    }
    class func requestRandomImage(completionHandler: @escaping (DogImage?, Error?) -> Void) {
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
        }
        task.resume()
    }
    
    class func requestImageFile (url: URL, completionHandler: @escaping (UIImage?, Error?) -> Void) {
        let task = URLSession.shared.dataTask(with: url
            , completionHandler: { (data, response, error) in
                guard let data = data else {
                    completionHandler(nil, error)
                    return
                }
                let downloadedImage = UIImage(data: data)
                completionHandler(downloadedImage, nil)
        })
        task.resume()
    }
    
}
