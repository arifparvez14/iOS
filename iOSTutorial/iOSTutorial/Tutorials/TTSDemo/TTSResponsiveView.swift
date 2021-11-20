//
//  TTSResponsiveView.swift
//  TTSDemo
//

import WebKit
import UIKit

protocol TTSResponsiveViewDelegate: AnyObject {
    func speakingStatusChanged(isSpeaking: Bool)
    func onVoiceEnd()
    func onReady()
}

class TTSResponsiveView: UIView {
    var wkView: WKWebView!
    weak var ttsResponsiveViewDelegate: TTSResponsiveViewDelegate?
    private let TAG: String = "TTSResponsiveView"
    public let engineName = "Responsive"
    let iosListener = "iosListener"
    let speakingListener = "speakingListener"
    
    init() {
        super.init(frame: .zero)
        let contentController = WKUserContentController()
        contentController.add(
            self as WKScriptMessageHandler,
            name: iosListener
        )
        contentController.add(
            self as WKScriptMessageHandler,
            name: speakingListener
        )
        
        let config = WKWebViewConfiguration()
        config.userContentController = contentController
        wkView = WKWebView(frame: .zero, configuration: config)
        self.addSubview(wkView)
        
        wkView.translatesAutoresizingMaskIntoConstraints = false
        wkView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        wkView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        wkView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        wkView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        
        wkView.isHidden = true
        wkView.navigationDelegate = self
        
        let htmlPath = Bundle.main.url(forResource: "resv_1.8.1", withExtension: "html")!
        let request = URLRequest(url: htmlPath)
        wkView.load(request)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func TTSPlay(voice: String, text: String ) {
        
        wkView.evaluateJavaScript("play(\"\(voice)\", \"\(text)\")") {( _, error) in
            guard error == nil else {
                return
            }
        }
    }
    
    func setRate(rate: String) {
        print("Pitch rate \(rate)")
        wkView.evaluateJavaScript("setPitchRate('\(rate)')") {( _, error) in
            guard error == nil else {
                return
            }
        }
    }
    
    func stopEngineProcess() {
        self.ttsResponsiveViewDelegate?.speakingStatusChanged(isSpeaking: false)
        wkView.evaluateJavaScript("cancel()") {( _, error) in
            guard error == nil else {
                return
            }
        }
    }
    
    func stopTTS() {
        stopEngineProcess()
    }
    
    func checkSpeakingStatus() {
        wkView.evaluateJavaScript("isSpeaking()") {(_, error) in
            guard error == nil else {
                return
            }
        }
    }
}

extension TTSResponsiveView: WKScriptMessageHandler, WKNavigationDelegate {
    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
        switch message.name {
        case iosListener:
            PrintUtility.printLog(tag: TAG, text: "iosListener: \(message.body)")
            if message.body as? String == "Start"{
                self.ttsResponsiveViewDelegate?.speakingStatusChanged(isSpeaking: true)
            }
            if message.body as? String == "end"{
                stopEngineProcess()
                self.ttsResponsiveViewDelegate?.onVoiceEnd()
            }
            
        case speakingListener:
            PrintUtility.printLog(tag: TAG, text: "iosListener speaking: \(message.body)")
            if message.body as? Bool == true {
                self.ttsResponsiveViewDelegate?.speakingStatusChanged(isSpeaking: false)
                PrintUtility.printLog(tag: TAG, text: "iosListener speaking: \("playing")")
            } else {
                self.ttsResponsiveViewDelegate?.speakingStatusChanged(isSpeaking: true)
                PrintUtility.printLog(tag: TAG, text: "iosListener speaking: \("not playing")")
            }
        default:
            break
        }
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        self.ttsResponsiveViewDelegate?.onReady()
    }
}

public class PrintUtility {
    static var isPrintingOn = true
    
    public static func printLog(tag: String, text: String) {
        if isPrintingOn {
            print(tag + " " + text)
        }
    }
    
    public static func debugPrintLog(_ items: Any..., separator: String = " ", terminator: String = "\n") {
        if isPrintingOn {
            debugPrintLog(items, separator, terminator)
        }
    }
}
