//
//  ViewController.swift
//  OPenWeatherApp
//
//  Created by Sharetrip-iOS on 28/09/2020.
//

import UIKit
import Combine
import PKHUD

class ViewController: UIViewController {

    @IBOutlet weak var weatherLabel: UILabel!
    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var latLongLabel: UILabel!

    private var subscriptions = Set<AnyCancellable>()
    private let viewModel = WeatherViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        setWeatherData()
    }


    @IBAction func getData(_ sender: Any) {
        HUD.show(.progress)
        viewModel.getWeatherInfo()
        HUD.hide()
    }

    func setWeatherData() {
        subscriptions = [
            viewModel.$cityName.assign(to: \.text!, on: weatherLabel),
            viewModel.$temperature.assign(to: \.text!, on: tempLabel),
        ]

        viewModel.$latLong.compactMap { location -> (Double, Double)? in
            guard let lat = location?.lat, let long = location?.lon else { return nil}
            return (lat, long)
        }.sink { [weak self] location in
            self?.latLongLabel.text = "\(location.0), \(location.1)"
        }.store(in: &subscriptions)
    }
}

