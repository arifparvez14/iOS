//
//  WeatherService.swift
//  OPenWeatherApp
//
//  Created by Sharetrip-iOS on 28/09/2020.
//

import Foundation
import Combine
import Alamofire

class WebService {
    func fetchWeather() -> AnyPublisher<WeatherResponse, Error>{
        let url = "http://api.openweathermap.org/data/2.5/weather?q=Houston&appid=9ae20fbefe080c03833068c4f41cae8a&units=imperial"
        guard let weatherURL = URL(string: url) else { fatalError("Invalid URL")}

        return URLSession.shared.dataTaskPublisher(for: weatherURL)
            .map{ $0.data}
            .decode(type: WeatherResponse.self, decoder: JSONDecoder())
            .map{ $0.self}
            .receive(on: RunLoop.main)
            .eraseToAnyPublisher()
    }
}
