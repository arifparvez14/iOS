//
//  ViewController.swift
//  PlayingCard
//
//  Created by SOL iOS1 on 23/1/19.
//  Copyright © 2019 SOL iOS1. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        var deck = PlayingCardDeck()
        
        super.viewDidLoad()
        for _ in 1...10{
            if let card = deck.draw(){
                print("\(card)")
            }
        }
        
    }


}

