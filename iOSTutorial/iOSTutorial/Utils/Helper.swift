//
//  Constant.swift
//  iOSTutorial
//

import UIKit

class Helper {
    private static var topicsData = [String]()
    
    static func prepareData() {
        topicsData.append("SQLight")
        topicsData.append("SwipeToSlide")
        topicsData.append("CircularAnimation")
        topicsData.append("AudioRecorder")
        topicsData.append("TTS Response")
        topicsData.append("Bottom Card View")
        topicsData.append("PanGesture")
        topicsData.append("CircularLoader")
        topicsData.append("CircularLoaderIndicator")
        topicsData.append("SelfFittedTableView")
    }
    
    static func getTopicsCount() -> Int {
        return self.topicsData.count
    }
    
    static func getTopicName(_ index: Int) -> String {
        return self.topicsData[index]
    }
}
