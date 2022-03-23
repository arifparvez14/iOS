//
//  CircularLoaderVC.swift
//  iOSTutorial
//

import UIKit

class CircularLoaderVC: UIViewController {
    var viewTitle: String!
    var activityIndicator: ActivityIndicatorView!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = viewTitle
        startAnimating()
    }

    func startAnimating() {
        activityIndicator = ActivityIndicatorView(
            frame: .zero,
            color: .white,
            padding: 70,
            lineWidth: 10.0)

        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(activityIndicator)

        NSLayoutConstraint.activate([
            activityIndicator.widthAnchor.constraint(equalToConstant: 50),
            activityIndicator.heightAnchor.constraint(equalToConstant: 50),
            activityIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])

        activityIndicator.startAnimating()

        DispatchQueue.main.asyncAfter(deadline: .now() + 50) {
            self.activityIndicator.stopAnimating()
        }
    }
}
