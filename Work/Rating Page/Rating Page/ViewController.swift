//
//  ViewController.swift
//  Rating Page
//
//  Created by SOL iOS Mac Mini on 6/27/19.
//  Copyright © 2019 com.arif. All rights reserved.
//

import UIKit
import Cosmos
import SwiftyJSON

class ViewController: UIViewController {

    @IBOutlet weak var customView: CosmosView!
    @IBOutlet weak var ratingText: UILabel!
    @IBOutlet weak var submitButton: UIButton!
    @IBOutlet weak var profilePicImageView: UIImageView!
    var rating = Double()
    override func viewDidLoad() {
        super.viewDidLoad()
        setUPStarImageView()
        submitButton.layer.cornerRadius = 15
        
        
//        if let path = Bundle.main.path(forResource: "document", ofType: "json") {
//            do {
//                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
//                let jsonResult = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves)
//                if let jsonResult = jsonResult as? Dictionary<String, AnyObject>, let person = jsonResult["categories"] as? [Any] {
//                    print("jsonResult: \(jsonResult)")
//                }
//            } catch {
//                print("error)")
//            }
//        }
        
        if let path = Bundle.main.path(forResource: "document", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .alwaysMapped)
                let jsonObj = try JSON(data: data)
                print("jsonData:\(jsonObj)")
            } catch let error {
                print("parse error: \(error.localizedDescription)")
            }
        } else {
            print("Invalid filename/path.")
        }
        
    }
    func setUPStarImageView()
    {
        customView.rating = 0
        customView.didFinishTouchingCosmos = {
            rating in
            print(rating)
        }
        customView.didTouchCosmos = {
            rating in
            if rating == 1.0{
                self.ratingText.text = "Poor"
                self.rating = 1.0
            }
            else if rating == 2.0{
                self.ratingText.text = "Average"
                self.rating = 2.0
            }
            else if rating == 3.0{
                self.ratingText.text = "Good"
                self.rating = 3.0
            }
            else if rating == 4.0{
                self.ratingText.text = "Very Good"
                self.rating = 4.0
            }
            else if rating == 5.0{
                self.ratingText.text = "Excellent"
                self.rating = 5.0
            }
        }
    }
    
    
    
    @IBAction func submitButtonTapped(_ sender: Any) {
       print("Submit button Tapped")
    }
    
//    func giveReviewToTheKandographer(params: [String: Any], onSuccess: @escaping success, onFailure: @escaping failure) {
//
//        let endPoint = Constants.Api.getMasterDataVersion
//        guard let token = KeychainWrapper.standard.string(forKey: "jwtToken") else {
//            let error = CustomError(title: "Error", description: "Token not found", code: 101)
//            onFailure(error)
//            return
//        }
//
//        let sessionID = self.getSessionID()
//        let headerInfo = [
//            "X-USER-SESSION-ID": sessionID,
//            "X-KANDIID-TOKEN":token
//            ] as [String: String]
//
//        Alamofire.request(endPoint, method: .get, parameters: params, encoding: URLEncoding.default, headers: headerInfo).responseObject { (response: DataResponse<GiveKandographerRating>) in
//            switch response.result {
//            case .success(let responseObject):
//                print(responseObject)
//                onSuccess(responseObject)
//                break
//            case .failure(let error):
//                onFailure(error)
//                break
//            }
//        }
//
//    }
    
}


//class GiveKandographerRating: BaseResponse {
//    var response: RateKandographer?
//
//    required init?(map: Map) {
//        super.init(map: map)
//    }
//
//    override func mapping(map: Map) {
//        super.mapping(map: map)
//        response <- map["data"]
//    }
//}
//
//class RateKandographer: Mappable {
//    var status: Int?
//    var message: String?
//
//    required init?(map: Map) {
//
//    }
//    func mapping(map: Map) {
//        status <- map["status"]
//        message <- map["msg"]
//    }
//}

