//
//  ConcentrationThemeChooserViewController.swift
//  Concentrate
//
//  Created by SOL iOS Mac Mini on 2/5/19.
//  Copyright © 2019 SOL iOS1. All rights reserved.
//

import UIKit

class ConcentrationThemeChooserViewController: UIViewController {

    let themes = [
        "Sports": "⚽️🏀🏈⚾️🥎🏐🎱🏓🎯🎳🎲🏂",
        "Animal":"🐶🐓🦋🦇🦉🦀⛄️🐉🐙🐍🐙🦕",
        "Faces":"😀😂😎🤪😕😩😷🤒😑😴",
    ]
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Choose Theme"{
            if let themeName = (sender as? UIButton)?.currentTitle, let theme = themes[themeName]{
                if let cvc = segue.destination as? ConcentrationViewController{
                    cvc.theme = theme
                }
            }
        }
    }
}
