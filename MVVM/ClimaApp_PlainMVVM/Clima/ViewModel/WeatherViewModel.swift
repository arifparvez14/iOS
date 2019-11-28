//
//  WeatherViewModel.swift
//  Clima
//
//  Created by SOL MAC 15 on 27/11/19.
//  Copyright © 2019 App Brewery. All rights reserved.
//

import Foundation

protocol WeatherViewModelDelegate {
    func didUpdateWeather(_ weatherViewModel: WeatherViewModel, weather: weatherModel)
    func didFailWithError(error: Error)
}

struct WeatherViewModel {
    
    var delegate: WeatherViewModelDelegate?
     let requestManager = WeatherManager.manager
    
    func fetchWeather(cityName: String) {
        requestManager.fetchWeather(cityName: cityName, onSuccess: { (getWeatherDataSuccess) in
            if let data = self.parseJSON(weatherData: getWeatherDataSuccess) {
                self.delegate?.didUpdateWeather(self, weather: data)
            }
        }) { (error) in
            self.delegate?.didFailWithError(error: error)
        }
    }
    
    func parseJSON(weatherData: Data) -> weatherModel? {
           let decoder = JSONDecoder()
           do {
               let decodedData = try decoder.decode(WeatherData.self, from: weatherData)
               let id = decodedData.weather[0].id
               let temp = decodedData.main.temp
               let name = decodedData.name
               
               let weather = weatherModel(conditionId: id, cityName: name, temperature: temp)
               return weather
               
           } catch {
               delegate?.didFailWithError(error: error)
               return nil
           }
       }
}

