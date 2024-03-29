//
//  TestAddView.swift
//  STAdvertisementLib
//
//  Created by Sharetrip-iOS on 26/07/2021.
//

import UIKit
import WebKit
import CoreTelephony
import Network
import AuthenticationServices

public protocol GNRADFullScreenContentDelegate: class{
    func adDidDismissFullScreenContent()
}

public class GNRInterstitialAd: UIViewController {

    private let viewModel = AddViewModel(service: AddService())
    public var htmlStr = String()
    public typealias CompletionCallBack = (_ success: Bool?, _ error: String?) -> Void
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
    
    var carrierName:String {
        CTTelephonyNetworkInfo().serviceSubscriberCellularProviders?.first?.value.carrierName ?? "Wifi"
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        self.webView.loadHTMLString(self.htmlStr, baseURL: nil)
        webView.navigationDelegate = self
        setupView()
    }
    
    public override func viewDidAppear(_ animated: Bool) {
        getDeviceIdentifierInfo()
        checkCarrearName()
        checkDeviceName()
        checkInternetConnection()
        checkVersion()
        handleAppleIdRequest()
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
}

//MARK:- WKNavigationDelegate Delegate
extension GNRInterstitialAd: WKNavigationDelegate {
    private func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        print("------------ Web View didn't Loaded ------------")
    }
    
    private func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
       print("------------ Web View Loaded ------------")
    }
}

//MARK:- Apple info {
extension GNRInterstitialAd {
    private func handleAppleIdRequest(){
        if #available(iOS 13.0, *) {
            let appleIDProvider = ASAuthorizationAppleIDProvider()
            let request = appleIDProvider.createRequest()
            request.requestedScopes = [.fullName, .email]
            let authorizationController = ASAuthorizationController(authorizationRequests: [request])
            authorizationController.delegate = self
            authorizationController.presentationContextProvider = self
            authorizationController.performRequests()
        }
    }
}

//MARK:- Apple info
extension GNRInterstitialAd: ASAuthorizationControllerDelegate, ASAuthorizationControllerPresentationContextProviding {
    @available(iOS 13.0, *)
    public func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
        switch authorization.credential {
        case let appleIDCredential as ASAuthorizationAppleIDCredential:
            let identityToken = appleIDCredential.identityToken
            let identityTokenStr = String(decoding: identityToken ?? Data(), as: UTF8.self)
            
            print(identityTokenStr)
            
        case let passwordCredential as ASPasswordCredential:
            let userName = passwordCredential.user
            let password = passwordCredential.password
            print(userName)
            print(password)

        default:
            break
        }
    }
    
    @available(iOS 13.0, *)
    public func presentationAnchor(for controller: ASAuthorizationController) -> ASPresentationAnchor {
        return self.view.window!
    }
}

//MARK:- Check additional info
extension GNRInterstitialAd {
    private func getDeviceIdentifierInfo() {
        print(UIDevice.current.identifierForVendor)
        print(UIDevice.current.name)
        print(UIDevice.current.model)
        print(UIDevice.current.systemName)
        print(UIDevice.current.systemVersion)
        print(UIDevice.current.localizedModel)
        print(UIDevice.current.proximityState)
        print(UIDevice.current.batteryLevel)
        print(UIDevice.current.batteryState)
        print(UIDevice.current.userInterfaceIdiom)
        
    }
    private func checkCarrearName() {
        print(carrierName)
    }
    private func checkDeviceName() {
        print(UIDevice.modelName)
    }
    
    private func checkVersion() {
        let os = ProcessInfo().operatingSystemVersion
        print(os.majorVersion)
        print(os.minorVersion)
        print(os.patchVersion)
        print(os.getFullVersion())
    }
    
    private func checkInternetConnection() {
        let nwPathMonitor = NWPathMonitor()
        nwPathMonitor.pathUpdateHandler = { path in

            if path.usesInterfaceType(.wifi) {
                print("Path is Wi-Fi")
            } else if path.usesInterfaceType(.cellular) {
                    print("Path is Cellular")
            } else if path.usesInterfaceType(.wiredEthernet) {
                    print("Path is Wired Ethernet")
            } else if path.usesInterfaceType(.loopback) {
                    print("Path is Loopback")
            } else if path.usesInterfaceType(.other) {
                    print("Path is other")
            }
        }
        nwPathMonitor.start(queue: .main)
    }
}



