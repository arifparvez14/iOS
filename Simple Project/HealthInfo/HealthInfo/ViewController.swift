//
//  ViewController.swift
//  HealthInfo
//
//  Created by SOL MAC 15 on 25/3/20.
//  Copyright © 2020 SOL MAC 15. All rights reserved.
//

import UIKit
import CoreLocation
import CoreMotion

class ViewController: UIViewController, CLLocationManagerDelegate {
    
    @IBOutlet var latitute: UILabel!
    @IBOutlet var longitute: UILabel!
    
    @IBOutlet var startButton: UIButton!
    @IBOutlet var stepsCountLabel: UILabel!
    @IBOutlet var activityTypeLabel: UILabel!
    
    @IBOutlet var distanceLabel: UILabel!
    @IBOutlet var timeLabel: UILabel!
    @IBOutlet var caloriesLabel: UILabel!
    
    let locationManager = CLLocationManager()
    
    private let activityManager = CMMotionActivityManager()
    private let pedometer = CMPedometer()
    private var shouldStartUpdating: Bool = false
    private var startDate: Date? = nil
    
    //per mile
    var averageSteps = 2000
    var averageKM: Float = 1.609
    //Per km
    var averageCal = 55
    
    //duration
    var averageDuration = 15 //mins
    let coveredSteps = 132
    var stepsCountUpdateInterval: TimeInterval = 60
    
    var steps: Int = 0
    var calories: Float = 0
    var duration: Float = 0
    var distance: Float = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpLocationFunctionlity()
        startButton.addTarget(self, action: #selector(didTapStartButton), for: .touchUpInside)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        guard let startDate = startDate else { return }
        updateStepsCountLabelUsing(startDate: startDate)
    }
    //Location related functions
    func setUpLocationFunctionlity() {
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.requestAlwaysAuthorization()
        locationManager.startUpdatingLocation()
    }
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location = locations[0]
        let myLocation: CLLocationCoordinate2D = CLLocationCoordinate2DMake(location.coordinate.latitude, location.coordinate.longitude)
        print(myLocation)
        self.latitute.text = "Latitute:  \(myLocation.latitude)"
        self.longitute.text = "Longitute:  \(myLocation.longitude)"
    }
    
    //Pedometer related functions
    @objc private func didTapStartButton() {
        shouldStartUpdating = !shouldStartUpdating
        shouldStartUpdating ? (onStart()) : (onStop())
    }
    
    private func onStart() {
        startButton.setTitle("Stop Pedometer", for: .normal)
        startDate = Date()
        checkAuthorizationStatus()
        startUpdating()
    }

    private func onStop() {
        startButton.setTitle("Start Pedometer", for: .normal)
        startDate = nil
        stopUpdating()
    }
    
    private func checkAuthorizationStatus() {
        switch CMMotionActivityManager.authorizationStatus() {
        case CMAuthorizationStatus.denied:
            onStop()
            activityTypeLabel.text = "Not available"
            stepsCountLabel.text = "Not available"
        default:break
        }
    }
    
    private func startUpdating() {
        if CMMotionActivityManager.isActivityAvailable() {
            startTrackingActivityType()
        } else {
            activityTypeLabel.text = "Not available"
        }

        if CMPedometer.isStepCountingAvailable() {
            startCountingSteps()
        } else {
            stepsCountLabel.text = "Not available"
        }
    }
    
    private func startTrackingActivityType() {
        activityManager.startActivityUpdates(to: OperationQueue.main) {
            [weak self] (activity: CMMotionActivity?) in
            guard let activity = activity else { return }
            DispatchQueue.main.async {
                if activity.walking {
                    self?.activityTypeLabel.text = "Walking"
                } else if activity.stationary {
                    self?.activityTypeLabel.text = "Stationary"
                } else if activity.running {
                    self?.activityTypeLabel.text = "Running"
                } else if activity.automotive {
                    self?.activityTypeLabel.text = "Automotive"
                }
            }
        }
    }
    
    private func startCountingSteps() {
        var stepsend = [Int]()
        pedometer.startUpdates(from: Date()) { [weak self] pedometerData, error in
            guard let pedometerData = pedometerData, error == nil else { return }
            let currentSteps = pedometerData.numberOfSteps.intValue
            DispatchQueue.main.async {
                self?.stepsCountLabel.text = pedometerData.numberOfSteps.stringValue
            }
            
            if !stepsend.contains(currentSteps) {
                stepsend.append(currentSteps)
                if stepsend.count == 1 {
                    let params = self?.getCaloriesDistanceDurationFromSteps(steps: pedometerData.numberOfSteps.intValue)
                    self?.setLabels(params: params)
                } else {
                    let steps = abs(stepsend[stepsend.count - 2] - stepsend[stepsend.count - 1])
                    let params = self?.getCaloriesDistanceDurationFromSteps(steps: steps)
                    self?.setLabels(params: params)
                }
                
            }
            
        }
    }
    
    private func stopUpdating() {
        activityManager.stopActivityUpdates()
        pedometer.stopUpdates()
        pedometer.stopEventUpdates()
    }
    
    
    private func on(error: Error) {
        //handle error
    }

    private func updateStepsCountLabelUsing(startDate: Date) {
        pedometer.queryPedometerData(from: startDate, to: Date()) {
            [weak self] pedometerData, error in
            if let error = error {
                self?.on(error: error)
            } else if let pedometerData = pedometerData {
                DispatchQueue.main.async {
                    self?.stepsCountLabel.text = String(describing: pedometerData.numberOfSteps)
                }
            }
        }
    }
    
    func getCaloriesDistanceDurationFromSteps(steps: Int) -> (calories: Float, distances: Float, durations: Float) {
        
        let coveredMiles = Float(steps)/Float(averageSteps)
        let coveredKM = Float(coveredMiles) * averageKM
        let coveredCal = coveredKM * Float(averageCal)
        
        let tempAvgDuration = averageDuration * 60
        print(tempAvgDuration * steps)
        print()
        print(averageSteps)
        let dutation = Float((tempAvgDuration * steps))/Float(averageSteps)
        
        return (coveredCal, Float(coveredKM*1000), dutation)
    }
    
    func getCalories() -> Float {
        
        let coveredMiles = Float(steps)/Float(averageSteps)
        let coveredKM = Float(coveredMiles) * averageKM
        let coveredCal = coveredKM * Float(averageCal)
        return coveredCal
    }
    
    func setLabels(params: (calories: Float, distances: Float, durations: Float)?){
        DispatchQueue.main.async {
            self.timeLabel.text = "\(params?.0 ?? 0) s"
            self.distanceLabel.text = "\(params?.1 ?? 0) m"
            self.caloriesLabel.text = "\(params?.2 ?? 0) c"
        }
    }
    
    @IBAction func backBtnTapped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
}


