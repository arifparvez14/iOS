//
//  ViewController.swift
//  iOSCrashlyticsTest
//
//  Created by Sharetrip-iOS on 12/07/2021.
//

import UIKit
import FirebaseCrashlytics
import FirebasePerformance

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let button = UIButton(type: .roundedRect)
        button.frame = CGRect(x: 20, y: 50, width: 100, height: 30)
        button.setTitle("SceondVC", for: [])
        button.addTarget(self, action: #selector(self.crashButtonTapped(_:)), for: .touchUpInside)
        view.addSubview(button)
        
        Crashlytics.crashlytics().log("View Controller")
        Crashlytics.crashlytics().setCustomValue(2021, forKey: "Year")
        Crashlytics.crashlytics().setUserID("424802")
        
        let userInfo = [
            NSLocalizedDescriptionKey: NSLocalizedString("The request failed", comment: ""),
            "ProductID": "712601",
            "UserID": "S Paul"
        ]
        
        let error = NSError(domain: NSURLErrorDomain, code: -1001, userInfo: userInfo)
        Crashlytics.crashlytics().record(error: error)
        
        
    
    }
    
    @IBAction func crashButtonTapped(_ sender: AnyObject) {
        //Crashlytics.crashlytics().log("Crash button tap")
        //fatalError()
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
        
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "SecondViewController") as! SecondViewController
        //self.navigationController?.pushViewController(nextViewController, animated: true)
        self.present(nextViewController, animated:true, completion:nil)
    }
}

