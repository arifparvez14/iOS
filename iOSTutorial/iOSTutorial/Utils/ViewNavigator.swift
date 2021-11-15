//
//  ViewNavigator.swift
//  iOSTutorial
//

import UIKit

class ViewNavigator {
    static func navigateToView(using viewController: UIViewController, and index: Int) {
        if index == 0 {
            let vc = SQLightVC()
            vc.viewTitle = Helper.getTopicName(index)
            viewController.navigationController?.pushViewController(vc, animated: true)
        } else if index == 1 {
            let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SwipeToSlideVC") as! SwipeToSlideVC
            vc.viewTitle = Helper.getTopicName(index)
            viewController.navigationController?.present(vc, animated: true)
        } else if index == 2 {
            let vc = CircularAnimationVC()
            vc.viewTitle = Helper.getTopicName(index)
            viewController.navigationController?.pushViewController(vc, animated: true)

        } else if index == 3 {
            let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "AudioRecorderVC") as! AudioRecorderVC
            vc.viewTitle = Helper.getTopicName(index)
            viewController.navigationController?.pushViewController(vc, animated: true)
        } else if index == 4 {
            let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "TTSVC") as! TTSVC
            vc.viewTitle = Helper.getTopicName(index)
            viewController.navigationController?.pushViewController(vc, animated: true)
        } else if index == 5 {
            let vc = BottomCardVC()
            vc.viewTitle = Helper.getTopicName(index)
            viewController.navigationController?.pushViewController(vc, animated: true)
        }
    }
}
