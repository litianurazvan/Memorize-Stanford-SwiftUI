//
//  _Grid.swift
//  Memorize
//
//  Created by Razvan Litianu on 28/10/2020.
//

import SwiftUI

struct _Grid<Item: Identifiable & Equatable, ItemView: View>: View {
    let items: [Item]
    let viewForItem: (Item) -> ItemView


    init(_ items: [Item], viewForItem: @escaping (Item) -> ItemView) {
        self.items = items
        self.viewForItem = viewForItem
    }

    var body: some View {
        GeometryReader { proxy in
            let layout = GridLayout(itemCount: items.count, in: proxy.size)
            ForEach(items) { item in
                let index = items.firstIndex { $0 == item } ?? 0
                viewForItem(item)
                    .frame(width: layout.itemSize.width, height: layout.itemSize.height)
                    .position(layout.location(ofItemAt: index))
            }
        }
    }
}
