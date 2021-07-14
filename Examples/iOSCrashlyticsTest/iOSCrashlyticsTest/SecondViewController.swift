//
//  SecondViewController.swift
//  iOSCrashlyticsTest
//
//  Created by Sharetrip-iOS on 13/07/2021.
//

import UIKit
import FirebaseCrashlytics
import FirebasePerformance

class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        Crashlytics.crashlytics().log("Second View Controller")
        Crashlytics.crashlytics().setCustomValue(2022, forKey: "Year")
        Crashlytics.crashlytics().setUserID("424802")
        
        let userInfo = [
            NSLocalizedDescriptionKey: NSLocalizedString("The request failed again", comment: ""),
            "ProductID": "71260A",
            "UserID": "A Paul"
        ]
        
        let error = NSError(domain: NSURLErrorDomain, code: -1001, userInfo: userInfo)
        Crashlytics.crashlytics().record(error: error)
        
        apiCall()
    }
    
    func apiCall() {
        Crashlytics.crashlytics().log("Crash button tap")
        fatalError()
//        let urlString = "https://api.openweathermap.org/data/2.5/weather?q=&appid=9ae20fbefe080c03833068c4f41cae8a&units=imperial"
//        //let urlStr = URL(string: urlString)!
//        //guard let metric = HTTPMetric(url: urlStr, httpMethod: .get) else { return }
//
//        //metric.start()
//        guard let url = URL(string: urlString) else { return }
//        let request: URLRequest = URLRequest(url:url)
//        let session = URLSession(configuration: .default)
//        let dataTask = session.dataTask(with: request) { (urlData, response, error) in
//                if let httpResponse = response as? HTTPURLResponse {
//                 //metric.responseCode = httpResponse.statusCode
//                }
//                //metric.stop()
//        }
//        dataTask.resume()
    }

}
