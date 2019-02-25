//
//  ImageHandler.swift
//  Alamofire with Table View
//
//  Created by SOL iOS Mac Mini on 2/22/19.
//  Copyright © 2019 com.arif. All rights reserved.
//

import Foundation
import UIKit
import Alamofire
import AlamofireImage

let imageCache = NSCache<NSString, UIImage>()

extension UIImageView {
    func loadImageUsingCacheWithUrlString(_ urlString: String){
        self.image = nil
        
        //check for the image first
        if let cacheImage = imageCache.object(forKey: urlString as NSString){
            self.image = cacheImage
            return
        }
        
        //Otherwise fire off a new Download
        Alamofire.request(urlString).responseImage{ response in
            if let downloadedImage = response.result.value {
                imageCache.setObject(downloadedImage, forKey: urlString as NSString)
                self.image = downloadedImage
            }
        }
    }
}
