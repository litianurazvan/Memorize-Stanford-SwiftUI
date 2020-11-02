//
//  Cardify.swift
//  Memorize
//
//  Created by Razvan Litianu on 02/11/2020.
//

import SwiftUI

struct Cardify: ViewModifier {
    let isFaceUp: Bool

    func body(content: Content) -> some View {
        ZStack {
            if isFaceUp {
                RoundedRectangle(cornerRadius: cornerRadius).fill(Color.white)
                RoundedRectangle(cornerRadius: cornerRadius)
                    .stroke(lineWidth: lineWidth)
                content
            } else {
                RoundedRectangle(cornerRadius: cornerRadius)
            }
        }
    }
    //MARK: - Drawing Constants

    private let cornerRadius: CGFloat = 12
    private let lineWidth: CGFloat = 4
}

extension View {
    func cardify(isFaceUp: Bool) -> some View {
        return self.modifier(Cardify(isFaceUp: isFaceUp))
    }
}
