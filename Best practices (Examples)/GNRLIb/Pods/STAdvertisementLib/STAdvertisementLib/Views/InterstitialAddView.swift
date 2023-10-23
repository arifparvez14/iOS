//
//  InterstitialAddView.swift
//  STAdvertisementLib
//
//  Created by Sharetrip-iOS on 25/05/2021.
//

import Foundation
import WebKit

class InterstitialAddView: UIView {
    private lazy var containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.backgroundColor = UIColor.clear.cgColor
        view.layer.cornerRadius = 5.0
        return view
    }()
    
    private lazy var webView: WKWebView = {
        let webView = WKWebView()
        webView.translatesAutoresizingMaskIntoConstraints = false
        webView.scrollView.isScrollEnabled = false
        webView.contentMode = .scaleToFill
        webView.layer.backgroundColor = UIColor.red.cgColor
        return webView
    }()
    
    private lazy var closeButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Close", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        button.backgroundColor = UIColor.blue
        button.layer.cornerRadius = 5.0
        return button
    }()
    
    var callbackClosure: ((Bool) -> Void)?
    
    init(htmlString: String, callbackClosure: ((Bool) -> Void)?) {
        super.init(frame: .zero)
        self.callbackClosure = callbackClosure
        webView.loadHTMLString(htmlString, baseURL: nil)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        addSubview(containerView)
        containerView.addSubview(webView)
        containerView.addSubview(closeButton)
        closeButton.addTarget(self, action: #selector(closeButtonTapped(_:)), for: .touchUpInside)
        
        containerView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        containerView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        containerView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        containerView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
        webView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor).isActive = true
        webView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor).isActive = true
        webView.topAnchor.constraint(equalTo: containerView.topAnchor).isActive = true
        webView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor).isActive = true
        
        closeButton.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 10.0).isActive = true
        closeButton.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -10.0).isActive = true
        closeButton.widthAnchor.constraint(equalToConstant: 45.0).isActive = true
        closeButton.heightAnchor.constraint(equalToConstant: 30.0).isActive = true
    }
    
    @objc func closeButtonTapped(_ sender: Any){
        callbackClosure?(true)
    }
}
