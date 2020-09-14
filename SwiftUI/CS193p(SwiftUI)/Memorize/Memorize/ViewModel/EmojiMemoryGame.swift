//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Sharetrip-iOS on 07/09/2020.
//  Copyright © 2020 AP. All rights reserved.
//

import SwiftUI


class EmojiMemoryGame {

    //Only EmojiMemoryGame can change the model but everyone can access the model but can't cahnge anything
    //private(set) var model: MemoryGame<String>
    private var model: MemoryGame<String> = EmojiMemoryGame.createMemoryGame()


    static func createMemoryGame() -> MemoryGame<String> {
        let emojis: Array<String> = ["👻","🎃", "🕷"]
        return MemoryGame<String>(numberOfPairsOfCards: emojis.count) { pairIndex in
            return emojis[pairIndex]
        }
    }

    //MARK: - Access to the Model

    var cards: Array<MemoryGame<String>.Card> {
        model.cards
    }

    //MARK: - Intent (s)

    func choose(card: MemoryGame<String>.Card) {
        model.choose(card: card)
    }
}
