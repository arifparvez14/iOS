//
//  ViewController.swift
//  GNRLIb
//
//  Created by Sharetrip-iOS on 06/07/2021.
//

import UIKit
import STAdvertisementLib

class ViewController: UIViewController {

    var addView = AddView()
    private var isADLoaded: Bool?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addView.load { [weak self] (success, error) in
            if let error = error {
                print("Failed to load interstitial ad with error: \(error)")
                
                DispatchQueue.main.async {
                    self?.showAD()
                }
                //return
            }
            
            //self?.isADLoaded = success
            //self?.showAD()
        }
    }
    
    func showAD() {
//        if self.isADLoaded != nil {
//            addView.show()
//        }
        addView.show()
    }
}

