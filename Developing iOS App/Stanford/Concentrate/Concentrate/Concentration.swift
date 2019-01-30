import Foundation

class Concentration
{
    private(set) var cards = [Card]()
    
    private var indexOfOneAndOnlyFaceUpCard: Int? {//Optional coz there is some case where no or two card face up
        get{
            var foundIndex: Int?
            for index in cards.indices {
                if cards[index].isFaceUp {
                    if foundIndex == nil {
                        foundIndex = index
                    }else{
                        return nil
                    }
                }
            }
            return foundIndex
        }
        set{
            for index in cards.indices{
                cards[index].isFaceUp = (index == newValue)
            }
        }
    }
    func chooseCard(at index: Int){
        assert(cards.indices.contains(index), "Concentration.chooseCard(at: \(index)): choose index not in the cards")
        if !cards[index].isMatched { //It ignore cards alreday matched
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index { //if matchIndex is equal indexOf then we check
                //Case of one card face up
                
                if cards[matchIndex].identifier == cards[index].identifier{
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFaceUp = true
            }else{
                //No card face up or two card faceUp
                //for flipDownIndex in cards.indices{
                    //cards[flipDownIndex].isFaceUp = false
                //}
                //cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = index
            }
        }
    }
    
    init(numberOfPairsOfCards: Int){
        assert(numberOfPairsOfCards > 0, "Concentration.init(at: \(numberOfPairsOfCards)): You must have atleast one pair of cards")
        for _ in 1...numberOfPairsOfCards
        {
            let card = Card()
            cards += [card, card]
        }
        //TODO: Shuffle the cards
        for i in 0...3
        {
            print(cards[i])
        }
    }
}
