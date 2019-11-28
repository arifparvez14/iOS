//
//  WeatherManager.swift
//  Clima
//
//  Created by SOL MAC 15 on 24/11/19.
//  Copyright © 2019 App Brewery. All rights reserved.
//

import Foundation

struct WeatherManager {
    
    typealias success = (_ response:Data) -> Void
    typealias failure = (_ error:Error) -> Void
    
    static let manager = WeatherManager()
    
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?appid=9ae20fbefe080c03833068c4f41cae8a&units=metric"
    
    func fetchWeather(cityName: String, onSuccess: @escaping success, onFailure: @escaping failure) {
        let urlString = "\(weatherURL)&q=\(cityName)"
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    onFailure(error!)
                    return
                }
                if let safeData = data {
                    onSuccess(safeData as Data)
                }
              
            }
            task.resume()
        }
    }
}
