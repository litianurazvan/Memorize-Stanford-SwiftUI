//
//  MemoryGame.swift
//  Memorize
//
//  Created by Razvan Litianu on 26/10/2020.
//

import SwiftUI

struct MemoryGame<CardContent: Equatable> {
    
    struct Card: Identifiable, Equatable {
        var id = UUID()

        var isFaceUp: Bool = true
        var isMatched: Bool = false
        let content: CardContent
    }

    init(numberOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContent) {
        cards = []
        for pairIndex in 0..<numberOfPairsOfCards {
            let content = cardContentFactory(pairIndex)
            cards.append(Card(content: content))
            cards.append(Card(content: content))
        }
    }

    mutating func choose(card: Card) {
        guard let index = self.cards.firstIndex(where: { $0 == card }) else { return }
        cards[index].isFaceUp.toggle()
        print("card chosen: \(card)")
    }

    var cards: [Card]
}
