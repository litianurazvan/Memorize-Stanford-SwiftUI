//
//  MemoryGame.swift
//  Memorize
//
//  Created by Razvan Litianu on 26/10/2020.
//

import SwiftUI

extension Array {
    var firstIfOnly: Element? {
        count == 1 ? first : nil
    }
}

struct MemoryGame<CardContent: Equatable> {
    var cards: [Card]

    var indexOfTheOneAndOnlyFaceUpCard: Int? {
        get {
            cards.indices.filter { cards[$0].isFaceUp }.firstIfOnly
        }
        set {
            for index in cards.indices {
                cards[index].isFaceUp = index == newValue
            }
        }
    }

    struct Card: Identifiable, Equatable {
        var id = UUID()

        var isFaceUp: Bool = false
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
        guard let index = self.cards.firstIndex(where: { $0 == card }), !cards[index].isFaceUp, !cards[index].isMatched else { return }
        if let potentialMatchIndex = indexOfTheOneAndOnlyFaceUpCard {
            if cards[index].content == cards[potentialMatchIndex].content {
                cards[index].isMatched = true
                cards[potentialMatchIndex].isMatched = true
            }
            cards[index].isFaceUp = true
        } else {
            indexOfTheOneAndOnlyFaceUpCard = index
        }
    }

}
