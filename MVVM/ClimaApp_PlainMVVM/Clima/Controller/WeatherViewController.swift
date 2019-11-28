//
//  ViewController.swift
//  Clima
//
//  Created by Angela Yu on 01/09/2019.
//  Copyright © 2019 App Brewery. All rights reserved.
//
import UIKit
import CoreLocation

class WeatherViewController: UIViewController {
    
    @IBOutlet weak private var conditionImageView: UIImageView!
    @IBOutlet weak private var temperatureLabel: UILabel!
    @IBOutlet weak private var cityLabel: UILabel!
    @IBOutlet weak private var searchTextField: UITextField!
    
    private var weatherObject = WeatherViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        weatherObject.delegate = self
        searchTextField.delegate = self
    }
    
    @IBAction func locationPressed(_ sender: UIButton) {
    
    }
    
}

//MARK: - UITextFieldDelegate

extension WeatherViewController: UITextFieldDelegate {
    
    @IBAction func searchPressed(_ sender: Any) {
           searchTextField.endEditing(true)
       }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        searchTextField.endEditing(true)
        return true
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if textField.text != "" {
            return true
        } else {
            textField.placeholder = "Type somethings"
            return false
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if let city = searchTextField.text {
            weatherObject.fetchWeather(cityName: city)
        }
        searchTextField.text = ""
        searchTextField.placeholder = "Search"
    }
}

//MARK: - WeatherManagerDelegate

extension WeatherViewController: WeatherViewModelDelegate {
    func didUpdateWeather(_ weatherViewModel: WeatherViewModel, weather: weatherModel) {
        DispatchQueue.main.async {
            self.temperatureLabel.text = weather.temperatureString
            self.conditionImageView.image = UIImage(systemName: weather.conditionName)
            self.cityLabel.text = weather.cityName
        }
    }
    
    func didFailWithError(error: Error) {
        print(error)
    }
}


