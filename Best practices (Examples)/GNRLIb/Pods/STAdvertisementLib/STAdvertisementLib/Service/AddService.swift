//
//  AddService.swift
//  STAdvertisementLib
//
//  Created by Sharetrip-iOS on 25/05/2021.
//

import Foundation

class AddService {
    func fetchAddData(completion: @escaping (Result<AddData, Error>) -> ()) {
        let urlString = "https://dev-engine.green-red.com/ad"
        guard let url = URL(string: urlString) else {return}
        let parameterDictionary = [
            "cookie": "83LSI-IL388-FFX70-XX158",
            "browser": "Chrome",
            "browserVersion": "102.38.84.1",
            "displayWidth": 1920,
            "displayHeight": 1080,
            "platform": "Windows",
            "platformVersion": "Windows 10",
            "isMobileBrowser": false,
            "propertyId": "0e3d70b9-c527-36c1-9594-242e7b6f68c0",
            "placeId": "6b2207eb-4e1b-386a-8ca3-6e29d4f39fc7"
        ] as [String : Any]
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("https://dev-panel.green-red.com", forHTTPHeaderField: "origin")
        
        guard let httpBody = try? JSONSerialization.data(withJSONObject: parameterDictionary, options: []) else {return}
        request.httpBody = httpBody
        
        URLSession.shared.dataTask(with: request) { (data, res, err) in

            if let err = err {
                completion(.failure(err))
                return
            }

            //success
            do{
                let addDetails = try JSONDecoder().decode(AddData.self, from: data!)
                completion(.success(addDetails))
            } catch let jsonError {
                completion(.failure(jsonError))
            }

        }.resume()
    }
}
