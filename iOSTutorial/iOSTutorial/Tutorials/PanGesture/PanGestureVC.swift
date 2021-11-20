//
//  PanGestureVC.swift
//  iOSTutorial
//

import UIKit

class PanGestureVC: UIViewController {

    @IBOutlet weak private var folderIV: UIImageView!
    @IBOutlet weak private var deleteIV: UIImageView!
    
    var folderViewOrigin: CGPoint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addPanGesture(view: folderIV)
        folderViewOrigin = folderIV.frame.origin
    }
    
    func addPanGesture(view: UIView) {
        let pan = UIPanGestureRecognizer(target: self, action: #selector(PanGestureVC.handlePan(sender:)))
        view.addGestureRecognizer(pan)
    }
    
    @objc func handlePan(sender: UIPanGestureRecognizer) {
        let folderView = sender.view
        let translation = sender.translation(in: self.view)
        
        switch sender.state {
        case .began, .changed:
            folderView?.center = CGPoint(
                                    x: folderView?.center.x ?? 0 + translation.x,
                                    y: folderView?.center.y ?? 0 + translation.y)
        case .ended:
            break
        default:
            break
        }
    }
}
