//
//  MemoryGame.swift
//  Memorize
//
//  Created by ChihiroHayakawa on 2020/08/10.
//

import Foundation

struct MemoryGame<CardContent>{
    var cards: Array<Card>
    
    mutating func choose(card: Card) {
        print("Card chosen: \(card)")
        let chosenIndex: Int = self.index(of: card)
        self.cards[chosenIndex].isFaceUp = !self.cards[chosenIndex].isFaceUp
    }
    
    func index(of card: Card) -> Int {
        var matchIndex: Int? = nil
        for (index, cardI) in cards.enumerated() {
            if cardI.id == card.id {
                matchIndex = index
            }
        }
        if matchIndex != nil {
            return matchIndex!
        } else {
            return -1
        }
    }
    
    init(numberOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContent) {
        cards = Array<Card>()
        for pairIndex in 0..<numberOfPairsOfCards {
            let content = cardContentFactory(pairIndex)
            cards.append(Card(isFaceUp: true, isMatched: false, content: content, id: pairIndex))
            cards.append(Card(isFaceUp: true, isMatched: false, content: content, id: pairIndex + 100))
        }
        cards.shuffle()
    }
    
    struct Card: Identifiable {
        var isFaceUp: Bool
        var isMatched: Bool
        var content: CardContent
        var id: Int
    }
}
