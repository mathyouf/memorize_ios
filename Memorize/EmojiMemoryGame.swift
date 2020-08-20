//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by ChihiroHayakawa on 2020/08/10.
//

import SwiftUI

class EmojiMemoryGameView: ObservableObject {
    @Published private var model: MemoryGame<String> = EmojiMemoryGameView.createMemoryGame()

    static func createMemoryGame() -> MemoryGame<String> {
        let emojis: Array<String> = [ "😁","😟","😎","🥰","🙄","🤯","🙃","😇","😘","😖","😋","🤬","😨","🤫","😉","🤗","😷","🤑","🤐","🥴","🤢",
        ]
        let randrange2to6: Int = .random(in: 2...5)
        return MemoryGame<String>(numberOfPairsOfCards: randrange2to6) { pairIndex in
            return emojis[pairIndex]
        }
    }

    // MARK: = Access to the Model
    
    var cards: Array<MemoryGame<String>.Card> {
        model.cards
    }
    
    // MARK: = Intent(s)
    
    func choose(card: MemoryGame<String>.Card) {
        model.choose(card: card)
    }
}

struct EmojiMemoryGame_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
