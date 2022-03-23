//
//  PanGestureVC.swift
//  iOSTutorial
//

import UIKit

class PanGestureVC: UIViewController {

    @IBOutlet weak private var deleteIV: UIImageView!
    
    var folderViewOrigin: CGPoint!
    var viewTitle: String!
    
    lazy private var folderIV: UIImageView = {
       let imageView = UIImageView()
        imageView.frame = CGRect(x: 50, y: 100, width: 50, height: 50)
        imageView.image = UIImage(named: "folder_icon")
        imageView.isUserInteractionEnabled = true
        return imageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(folderIV)
        
        self.view.backgroundColor = .white
        self.navigationItem.title = viewTitle
        
        addPanGesture(view: folderIV)
        folderViewOrigin = folderIV.frame.origin
        view.bringSubviewToFront(folderIV)
    }
    
    private func addPanGesture(view: UIView) {
        let pan = UIPanGestureRecognizer(target: self, action: #selector(PanGestureVC.handlePan(sender:)))
        view.addGestureRecognizer(pan)
    }
    
    @objc private func handlePan(sender: UIPanGestureRecognizer) {
        let folderView = sender.view!
        
        switch sender.state {
        case .began, .changed:
            moveViewWithPan(view: folderIV, sender: sender)
        case .ended:
            if folderView.frame.intersects(deleteIV.frame) {
                deleteViewToOrigin(view: folderIV)
            } else {
                returnViewToOrigin(view: folderIV)
            }
        default:
            break
        }
    }
    
    private func moveViewWithPan(view: UIView, sender: UIPanGestureRecognizer) {
        let translation = sender.translation(in: self.view)
        
        view.center = CGPoint(
                x: view.center.x + translation.x,
                y: view.center.y + translation.y)
        
        // UIView.animate(withDuration: 0.03) {
            // view.frame.size.width = 50 + abs(translation.x * 10)
            // view.frame.size.height = 50 + abs(translation.x * 10)
        // }
        
        // imageView.frame = CGRect(x: 50, y: 100, width: 50, height: 50))
        sender.setTranslation(CGPoint.zero, in: self.view)
    }
    
    private func returnViewToOrigin(view: UIView) {
        UIView.animate(withDuration: 0.03) {
            self.folderIV.frame.origin = self.folderViewOrigin
        }
    }
    
    private func deleteViewToOrigin(view: UIView) {
        UIView.animate(withDuration: 0.03) {
            self.folderIV.alpha = 0.0
        }
    }
}
