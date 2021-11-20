//
//  SwipeToSlideVC.swift
//  iOSTutorial
//

import UIKit

class SwipeToSlideVC: UIViewController {

    @IBOutlet weak var sideView: UIView!
    @IBOutlet weak var blurView: UIVisualEffectView!
    @IBOutlet weak var sideViewLeadingConstrain: NSLayoutConstraint!
    var viewTitle: String!
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.navigationItem.title = viewTitle
        
        blurView.layer.cornerRadius = 15
        blurView.clipsToBounds = true
        sideView.layer.shadowColor = UIColor.black.cgColor
        sideView.layer.shadowOpacity = 0.8
        sideView.layer.shadowOffset = CGSize(width: 5, height: 0)
        
        sideViewLeadingConstrain.constant = -175
        
        let panGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(didSwipe(_:)))
        self.view.addGestureRecognizer(panGestureRecognizer)
    }
    
    @objc private func didSwipe(_ sender: UIPanGestureRecognizer) {
        if sender.state == .began || sender.state == .changed {
            
            let translation = sender.translation(in: self.view).x
            
            if translation > 0 { // swipe right
                if sideViewLeadingConstrain.constant < 0 {
                    UIView.animate(withDuration: 0.2) {
                        self.sideViewLeadingConstrain.constant += translation / 20
                        self.view.layoutIfNeeded()
                    }
                }
                
            } else { // swipe left
                
                if sideViewLeadingConstrain.constant > -175 {
                    UIView.animate(withDuration: 0.2) {
                        self.sideViewLeadingConstrain.constant += translation / 20
                        self.view.layoutIfNeeded()
                    }
                }
            }
        } else if sender.state == .ended {
            
            if sideViewLeadingConstrain.constant < -100 {
                UIView.animate(withDuration: 0.2) {
                    self.sideViewLeadingConstrain.constant = -175
                    self.view.layoutIfNeeded()
                }
            } else {
                UIView.animate(withDuration: 0.2) {
                    self.sideViewLeadingConstrain.constant = 0
                    self.view.layoutIfNeeded()
                }
            }
        }
    }
}
