//
//  Weather.swift
//  OPenWeatherApp
//
//  Created by Sharetrip-iOS on 28/09/2020.
//

import Foundation

struct WeatherResponse: Codable {
    let name: String?
    let main: Weather?
    let coord: coordinate?

    static var placeholder: WeatherResponse {
        return WeatherResponse(name: nil, main: nil, coord: nil)
    }

}

struct coordinate: Codable {
    let lon: Double
    let lat: Double
}

struct Weather: Codable {
    let temp: Double?
    let humidity: Double?

    static var placeholder: Weather {
        return Weather(temp: nil, humidity: nil)
    }

}

