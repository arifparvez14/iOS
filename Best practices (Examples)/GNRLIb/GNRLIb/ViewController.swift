//
//  ViewController.swift
//  GNRLIb
//
//  Created by Sharetrip-iOS on 06/07/2021.
//

import UIKit
import STAdvertisementLib

class ViewController: UIViewController {

    var interstitialAd = GNRInterstitialAd()
    var isAdLoaded: Bool?
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /*
        //- Configuration using AddView
         
        addView.load { [weak self] (success, error) in
            if let error = error {
                print("Failed to load interstitial ad with error: \(error)")

                DispatchQueue.main.async {
                    self?.showAD()
                }
            }
        }
        */
        
        //- Configuration using view controller
        interstitialAd.load{ [weak self] (success, error) in
            if let error = error {
                print("Failed to load interstitial ad with error: \(error)")
                //return
            }
            self?.isAdLoaded = true
            self?.interstitialAd.delegate = self
        }
    }

    @IBAction func loadAdAction(_ sender: Any) {
        if isAdLoaded ?? false {
            showAd()
        }
    }
    
    func showAd() {
        //interstitialAd.modalPresentationStyle = .fullScreen
        self.present(interstitialAd, animated: true, completion: nil)
    }
}

extension ViewController: GNRADFullScreenContentDelegate {
    func adDidDismissFullScreenContent() {
        print("Already Dismiss")
    }
}

