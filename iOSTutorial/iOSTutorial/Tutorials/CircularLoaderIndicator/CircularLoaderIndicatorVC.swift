//
//  CircularLoaderIndicatorVC.swift
//  iOSTutorial
//

import UIKit

class CircularLoaderIndicatorVC: UIViewController {
    var viewTitle: String!

    let loadingIndicator: ProgressView = {
        let progress = ProgressView(colors: [.red, .systemGreen, .systemBlue], lineWidth: 5)
        progress.translatesAutoresizingMaskIntoConstraints = false
        return progress
    }()

    let helloLabel: UILabel = {
        let label = UILabel()
        label.text = "Hello, World!"
        label.font = .systemFont(ofSize: 25)
        label.isHidden = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
        self.navigationItem.title = viewTitle
        loadingIndicator.isAnimating = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 20) {
            self.loadingIndicator.isAnimating = false
            self.helloLabel.isHidden = false
        }
    }

    private func setupUI() {
        if #available(iOS 13.0, *) {
            overrideUserInterfaceStyle = .light
        }

        self.view.backgroundColor = .white

        self.view.addSubview(helloLabel)
        self.view.addSubview(loadingIndicator)

        NSLayoutConstraint.activate([
            helloLabel.centerXAnchor
                .constraint(equalTo: self.view.centerXAnchor),
            helloLabel.centerYAnchor
                .constraint(equalTo: self.view.centerYAnchor)
        ])

        NSLayoutConstraint.activate([
            loadingIndicator.centerXAnchor
                .constraint(equalTo: self.view.centerXAnchor),
            loadingIndicator.centerYAnchor
                .constraint(equalTo: self.view.centerYAnchor),
            loadingIndicator.widthAnchor
                .constraint(equalToConstant: 50),
            loadingIndicator.heightAnchor
                .constraint(equalTo: self.loadingIndicator.widthAnchor)
        ])
    }
}
