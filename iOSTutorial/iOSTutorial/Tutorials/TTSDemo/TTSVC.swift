//
//  TTSVC.swift
//  iOSTutorial
//

import UIKit

class TTSVC: UIViewController {

    @IBOutlet weak var playTTSBtn: UIButton!
    var viewTitle: String!
    private let ttsResponsiveView = TTSResponsiveView()
    private var voice: String = ""
    private var rate: String = "1.0"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        super.viewDidLoad()
        playTTSBtn.layer.cornerRadius = 10.0
        ttsResponsiveView.ttsResponsiveViewDelegate = self
        self.view.addSubview(ttsResponsiveView)
        ttsResponsiveView.isHidden = true
        self.voice = "US English Female"
        self.rate = "1.0"
    }
    
    @IBAction func playTTSBtnTapped(_ sender: Any) {
        playTTS()
    }
    
    private func stopTTS() {
        ttsResponsiveView.stopTTS()
    }
    
    private func playTTS() {
        stopTTS()
        proceedAndPlayTTS()
    }
    
    private func proceedAndPlayTTS() {
        ttsResponsiveView.checkSpeakingStatus()
        ttsResponsiveView.setRate(rate: rate)
        ttsResponsiveView.TTSPlay(voice: voice, text: "Hold down the button and speak")
    }
}

extension TTSVC: TTSResponsiveViewDelegate {
    func speakingStatusChanged(isSpeaking: Bool) {}
    func onReady() {}
    func onVoiceEnd() {}
}
