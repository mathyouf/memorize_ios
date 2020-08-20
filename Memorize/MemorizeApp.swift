//
//  MemorizeApp.swift
//  Memorize
//
//  Created by ChihiroHayakawa on 2020/08/10.
//

import SwiftUI

@available(iOS 14.0, *)
@main
struct MemorizeApp: App {
    var body: some Scene {
        WindowGroup {
            let game = EmojiMemoryGameView()
            ContentView(viewModel: game)
        }
    }
}
