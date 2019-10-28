//
//  ViewController.swift
//  locationManager
//
//  Created by SOL iOS Mac Mini on 3/20/19.
//  Copyright © 2019 com.arif. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {

    let locationManager = CLLocationManager()
    var currentLocation: CLLocation? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.locationManager.requestAlwaysAuthorization()
        self.locationManager.requestWhenInUseAuthorization()
        locationManager.delegate = self
        self.startLocationServices()
    }
    func locationManager(_ manager: CLLocationManager,didChangeAuthorization status: CLAuthorizationStatus) {
        switch status {
        case .notDetermined:
            break
        case .authorizedWhenInUse, .authorizedAlways:
            if CLLocationManager.locationServicesEnabled() {
                self.locationManager.startUpdatingLocation()
            }
        case .restricted, .denied:
            self.alertLocationAccessNeeded()
        }
        
        
    }
    
    // Get the device's current location and assign the latest CLLocation value to your tracking variable
    func locationManager(_ manager: CLLocationManager,didUpdateLocations locations: [CLLocation]) {
        self.currentLocation = locations.last
    }
    
    func startLocationServices() {
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        
        let locationAuthorizationStatus = CLLocationManager.authorizationStatus()
        
        switch locationAuthorizationStatus {
        case .notDetermined:
            self.locationManager.requestWhenInUseAuthorization() // This is where you request permission to use location services
        case .authorizedWhenInUse, .authorizedAlways:
            if CLLocationManager.locationServicesEnabled() {
                self.locationManager.startUpdatingLocation()
            }
        case .restricted, .denied:
            self.alertLocationAccessNeeded()
        }
    }
    
    func alertLocationAccessNeeded() {
        let settingsAppURL = URL(string: UIApplication.openSettingsURLString)!
        
        let alert = UIAlertController(
            title: "Need Location Access",
            message: "Location access is required for including the location of the hazard.",
            preferredStyle: UIAlertController.Style.alert
        )
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .default, handler: nil))
        alert.addAction(UIAlertAction(title: "Allow Location Access",
                                      style: .cancel,
                                      handler: { (alert) -> Void in
                                        UIApplication.shared.open(settingsAppURL,
                                                                  options: [:],
                                                                  completionHandler: nil)
        }))
        
        present(alert, animated: true, completion: nil)
    }

 
}

