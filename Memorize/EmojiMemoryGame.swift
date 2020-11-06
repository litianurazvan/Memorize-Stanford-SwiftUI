//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Razvan Litianu on 26/10/2020.
//

import Foundation

class EmojiMemoryGame: ObservableObject {
    @Published var model = createMemoryGame()

    var cards: [MemoryGame<String>.Card] {
        model.cards
    }

    func choose(card: MemoryGame<String>.Card) {
        model.choose(card: card)
    }

    func reset() {
        model = EmojiMemoryGame.createMemoryGame()
    }

    private static func createMemoryGame() -> MemoryGame<String> {
        let emojiList = ["😁", "👏", "😲"]
        return MemoryGame(numberOfPairsOfCards: emojiList.count) { emojiList[$0] }
    }
}

extension EmojiMemoryGame {
    static let `default` = EmojiMemoryGame()
}
