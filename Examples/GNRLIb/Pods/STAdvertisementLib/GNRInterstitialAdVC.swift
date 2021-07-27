//
//  TestAddView.swift
//  STAdvertisementLib
//
//  Created by Sharetrip-iOS on 26/07/2021.
//

import UIKit
import WebKit

public protocol GNRADFullScreenContentDelegate: class{
    func adDidDismissFullScreenContent()
}

public class GNRInterstitialAd: UIViewController, WKNavigationDelegate {

    private let viewModel = AddViewModel(service: AddService())
    public var htmlStr = String()
    public typealias CompletionCallBack = (_ success: Bool?, _ error: String?) -> Void
    var callbackClosure: ((Bool) -> Void)?
    public weak var delegate: GNRADFullScreenContentDelegate?
    
    private lazy var containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.backgroundColor = UIColor.black.cgColor
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
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        self.webView.loadHTMLString(self.htmlStr, baseURL: nil)
        webView.navigationDelegate = self
        setupView()
    }
    
    private func setupView() {
        self.view.addSubview(containerView)
        containerView.addSubview(webView)
        containerView.addSubview(closeButton)
        closeButton.addTarget(self, action: #selector(closeButtonTapped(_:)), for: .touchUpInside)
        
        containerView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        containerView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        containerView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        containerView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        
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
        self.dismiss(animated: true, completion: nil)
        delegate?.adDidDismissFullScreenContent()
    }
    
    
    //Load Ad
    public func load(onCompletion: @escaping CompletionCallBack)  {
        viewModel.loadData() { [weak self] (success, err)  in
            if success {
                self?.htmlStr = self?.viewModel.getHTMLString() ?? ""
                onCompletion(true, nil)
            }
            else {
                self?.htmlStr = self?.viewModel.getHTMLString() ?? ""
                onCompletion(nil, err)
            }
        }
    }
    
    private func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        print("------------ Web View didn't Loaded ------------")
    }
    
    private func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
       print("------------ Web View Loaded ------------")
    }
}

