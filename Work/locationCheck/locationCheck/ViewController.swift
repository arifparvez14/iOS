//
//  ViewController.swift
//  locationCheck
//
//  Created by SOL iOS Mac Mini on 4/26/19.
//  Copyright © 2019 com.arif. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {
    
    let locationManager: CLLocationManager = CLLocationManager()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        for currentLocation in locations{
            print("\(index): \(currentLocation)")
            
        let loc = locations[0]
        print(loc.coordinate.latitude)
        print(loc.coordinate.longitude)
        }
    }


}

