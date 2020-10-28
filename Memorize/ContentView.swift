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
                    .aspectRatio(2/3, contentMode: .fit)
                    .onTapGesture {
                        viewModel.choose(card: card)
                    }
            }
        }
        .foregroundColor(Color.orange)
        .padding()
    }
}
struct CardView: View {
    var card: MemoryGame<String>.Card

    var body: some View {
        GeometryReader { geometryProxy in
            ZStack {
                if card.isFaceUp {
                    RoundedRectangle(cornerRadius: cornerRadius).fill(Color.white)
                    RoundedRectangle(cornerRadius: cornerRadius)
                        .stroke(lineWidth: lineWidth)
                    Text(card.content)
                } else {
                    RoundedRectangle(cornerRadius: cornerRadius)
                }
            }
            .font(.system(size: min(geometryProxy.size.width, geometryProxy.size.height) * fontScaleFactor))
        }
    }

    //MARK: - Drawing Constants

    let cornerRadius: CGFloat = 12
    let lineWidth: CGFloat = 4
    let fontScaleFactor: CGFloat = 0.75
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
