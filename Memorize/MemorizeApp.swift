//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Razvan Litianu on 23/10/2020.
//

import SwiftUI

@main
struct MemorizeApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: .default)
        }
    }
}
