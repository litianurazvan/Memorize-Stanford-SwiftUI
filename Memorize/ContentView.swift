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
        VStack {
            _Grid(viewModel.cards) { card in
                CardView(card: card)
                    .onTapGesture {
                        withAnimation(.easeOut) {
                            viewModel.choose(card: card)
                        }
                    }
                    .padding()
            }
            .foregroundColor(Color.orange)
            .padding()

            Button("New Game") {
                withAnimation(.easeInOut) {
                    viewModel.reset()
                }
            }
        }
    }
}

struct CardView: View {
    var card: MemoryGame<String>.Card

    var body: some View {
        GeometryReader { geometryProxy in
            if card.isFaceUp || !card.isMatched {
                ZStack {
                    Pie(startAngle: .degrees(-90), endAngle: .degrees(110-90), clockwise: true)
                        .padding(5)
                        .opacity(0.4)
                    Text(card.content)
                        .font(.system(size: min(geometryProxy.size.width, geometryProxy.size.height) * fontScaleFactor))
                        .rotationEffect(Angle.init(degrees: card.isMatched ? 360 : 0))
                        .animation(card.isMatched ? Animation.linear(duration: 1).repeatForever(autoreverses: false) : .default)
                }
                .cardify(isFaceUp: card.isFaceUp)
                .transition(.scale)
                
            }
        }
    }
    private let fontScaleFactor: CGFloat = 0.70
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
//        Group {
//            ContentView(viewModel: .default)
            let game = EmojiMemoryGame()
//            game.choose(card: game.cards[0])
            return ContentView(viewModel: game)
                .preferredColorScheme(.dark)
//        }
    }
}
