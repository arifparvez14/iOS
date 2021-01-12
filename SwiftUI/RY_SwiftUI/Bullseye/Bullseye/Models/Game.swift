//
//  Game.swift
//  Bullseye
//
//  Created by Sharetrip-iOS on 12/01/2021.
//

import Foundation

struct Game {
    var target: Int = Int.random(in: 0...100)
    var score = 0
    var round = 1
    
    func points(sliderValue: Int) -> Int {
       100 - abs(target - sliderValue)
    }
}
