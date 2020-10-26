//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Razvan Litianu on 26/10/2020.
//

import Foundation

let emojiList = ["😁", "👏", "😲"]

class EmojiMemoryGame: ObservableObject {
    @Published var model: MemoryGame<String> = MemoryGame(numberOfPairsOfCards: emojiList.count) { emojiList[$0] }

    var cards: [MemoryGame<String>.Card] {
        model.cards
    }

    func choose(card: MemoryGame<String>.Card) {
        model.choose(card: card)
    }

}

extension EmojiMemoryGame {
    static let `default` = EmojiMemoryGame()
}
