//
//  ContentView.swift
//  Memorize
//
//  Created by Razvan Litianu on 23/10/2020.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel: EmojiMemoryGame
    
    var body: some View {
        HStack {
            ForEach(viewModel.cards) { card in
                CardView(card: card)
                    .onTapGesture {
                        viewModel.choose(card: card)
                    }
            }
        }
        .foregroundColor(Color.orange)
        .font(.largeTitle)
        .padding()
    }
}
struct CardView: View {
    var card: MemoryGame<String>.Card

    var body: some View {
        ZStack {
            if card.isFaceUp {
                RoundedRectangle(cornerRadius: 12).fill(Color.white)
                RoundedRectangle(cornerRadius: 12)
                    .stroke(lineWidth: 4)
                Text(card.content)
            } else {
                RoundedRectangle(cornerRadius: 12)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView(viewModel: .default)
            ContentView(viewModel: .default)
                .preferredColorScheme(.dark)
        }
    }
}
