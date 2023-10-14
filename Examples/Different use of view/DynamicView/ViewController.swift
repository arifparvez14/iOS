//
//  ViewController.swift
//  DynamicView
//
//  Created by Muhammad Ariful islam on 4/10/23.
//

import UIKit

class ViewController: UIViewController {
    
    var messageView: MessageView!
    var text = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."
    var sampleText = "Lorem Ipsum is simply dummy text of the printing and typesetting industry"
    
    private weak var popupView: PopupView?
    @IBOutlet weak var infoView: InfoView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupInfoView()
        
    }
    
    @IBAction func popupTapped(_ sender: Any) {
        //showPopupView()
        showMessageView()
    }
    
    func setupInfoView() {
        let viewData = PopupViewData(
            imageViewWidth: 25,
            imageViewHeight: 25,
            text: self.text)
        
        infoView.setupView(viewData: viewData)
    }
    
    @objc func crossBtnTapped() {
        self.messageView.removeFromSuperview()
    }
    
    private func showMessageView() {
        self.messageView = MessageView(frame: self.view.frame, inView: self, iVWidth: 15, ivHeight: 15, text: text)
        //self.messageView = MessageView(frame: self.view.frame, inView: self, iVWidth: 15, ivHeight: 15, text: sampleText)
        self.messageView.crossBtn.addTarget(self, action: #selector(crossBtnTapped), for: .touchUpInside)
        self.view.addSubview(messageView)
    }
    
    private func showPopupView() {
        let viewData = PopupViewData(
            imageViewWidth: 5,
            imageViewHeight: 5,
            text: self.text)
        
        let popupView = PopupView(frame: UIScreen.main.bounds, viewData: viewData) { [weak self] crossBtnTapped in
            if crossBtnTapped {
                self?.popupView?.removeFromSuperview()
                self?.popupView = nil
            }
        }
        
        //popupView.imageView.tintColor = UIColor.appPrimaryDark
        view.addSubview(popupView)
        UIApplication.shared.keyWindow?.addSubview(popupView)
        self.popupView = popupView
    }
}



