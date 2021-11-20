//
//  ViewNavigator.swift
//  iOSTutorial
//

import UIKit

class ViewNavigator {
    static func navigateToView(using viewController: UIViewController, and index: Int) {
        let mainSB = UIStoryboard(name: "Main", bundle: nil)
        
        if index == 0 {
            let sqLightVC = SQLightVC()
            sqLightVC.viewTitle = Helper.getTopicName(index)
            viewController.navigationController?.pushViewController(sqLightVC, animated: true)
            
        } else if index == 1 {
            let controller = mainSB.instantiateViewController(withIdentifier: "SwipeToSlideVC") as? SwipeToSlideVC
            guard let swipeToSlideVC = controller else {return}
            
            swipeToSlideVC.viewTitle = Helper.getTopicName(index)
            swipeToSlideVC.navigationController?.present(swipeToSlideVC, animated: true)
            
        } else if index == 2 {
            let circularAnimationVC = CircularAnimationVC()
            circularAnimationVC.viewTitle = Helper.getTopicName(index)
            viewController.navigationController?.pushViewController(circularAnimationVC, animated: true)

        } else if index == 3 {
            let controller = mainSB.instantiateViewController(withIdentifier: "AudioRecorderVC") as? AudioRecorderVC
            guard let audioRecorderVC = controller else {return}
            
            audioRecorderVC.viewTitle = Helper.getTopicName(index)
            viewController.navigationController?.pushViewController(audioRecorderVC, animated: true)
            
        } else if index == 4 {
            let controller = mainSB.instantiateViewController(withIdentifier: "TTSVC") as? TTSVC
            guard let ttsVC = controller else {return}
            
            ttsVC.viewTitle = Helper.getTopicName(index)
            viewController.navigationController?.pushViewController(ttsVC, animated: true)
            
        } else if index == 5 {
            let bottomCardVC = BottomCardVC()
            bottomCardVC.viewTitle = Helper.getTopicName(index)
            viewController.navigationController?.pushViewController(bottomCardVC, animated: true)
            
        } else if index == 6 {
            
        }
    }
}
