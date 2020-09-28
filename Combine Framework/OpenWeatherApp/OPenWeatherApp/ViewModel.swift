//
//  ViewModel.swift
//  OPenWeatherApp
//
//  Created by Sharetrip-iOS on 28/09/2020.
//

import Foundation
import Combine

class WeatherViewModel {
    @Published var temperature: String = ""
    @Published var cityName: String = ""
    @Published var latLong: coordinate?

    private var webService = WebService()
    private var cancellable: AnyCancellable?

    func getWeatherInfo() {
        self.cancellable = self.webService.fetchWeather()
            .catch{_ in Just(WeatherResponse.placeholder)}
            .sink(receiveCompletion: { (callBack) in
                print("Inside Callback")
            }, receiveValue: { (weatherResponse) in
                self.temperature = "\(weatherResponse.main?.temp ?? 0.0)"
                self.cityName = "\(weatherResponse.name ?? "")"
                self.latLong = weatherResponse.coord 
            })
    }
}
