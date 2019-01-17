//
//  ViewController.swift
//  Concentrate
//
//  Created by SOL iOS1 on 16/1/19.
//  Copyright © 2019 SOL iOS1. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var flipCount = 0 {
        didSet{
            flipCountLevel.text = "Flips: \(flipCount)"
        }
    }
    
    
    @IBOutlet weak var flipCountLevel: UILabel!
    
    var emojiChoices = ["🎃","👻","🎃","👻"]
    
    @IBOutlet var cardButtons: [UIButton]!
    
    @IBAction func touchCard(_ sender: UIButton) {
        
        flipCount += 1
        if let cardNumber = cardButtons.index(of: sender){
            flipCard(withEmoji: emojiChoices[cardNumber], on: sender)
            print("cardNumber = \(cardNumber)")
        }else{
            print("Choosen card was not here")
        }
    }
    func flipCard(withEmoji emoji: String, on button: UIButton){
        if button.currentTitle == emoji{
            button.setTitle("", for: UIControl.State.normal)
            button.backgroundColor = #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
        }else{
                button.setTitle(emoji, for: UIControl.State.normal)
                button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        }
    }
}

