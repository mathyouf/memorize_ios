//
//  ContentView.swift
//  Memorize
//
//  Created by Matthew Fisher Tokyo XRML on 2020/08/10.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel: EmojiMemoryGameView
//    body is a property and View is a type, some means it is a type that behaves like a View
    var body: some View {
        Grid(viewModel.cards) { card in
            CardView(card: card).onTapGesture { viewModel.choose(card: card)
            }
        }
            .foregroundColor(.orange)
            .padding  ()
    }
}

struct CardView: View {
    var card: MemoryGame<String>.Card
    
    var body: some View {
        GeometryReader(content: { geometry in
            ZStack {
                if card.isFaceUp {
                    RoundedRectangle(cornerRadius: cornerRadius).fill(Color.white)
                    RoundedRectangle(cornerRadius: cornerRadius).stroke(lineWidth: edgeLineWidth)
                    Text(card.content)
                } else {
                    RoundedRectangle(cornerRadius: cornerRadius).fill()
                }
            }
//            .aspectRatio(2/3, contentMode: .fit)
            .font(Font.system(size: min(geometry.size.width, geometry.size.height) * fontScaleFactor))
        })
    }
    
    // MARK: - Drawing Constants
    
    let cornerRadius: CGFloat = 10.0
    let edgeLineWidth: CGFloat = 3.0
    let fontScaleFactor: CGFloat = 0.75
    
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGameView()
        ContentView(viewModel: game)
    }
}
