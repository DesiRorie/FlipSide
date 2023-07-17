//
//  FlipSideApp.swift
//  FlipSide
//
//  Created by Desi Rorie on 7/10/23.
//

import SwiftUI

@main
struct FlipSideApp: App {
    let viewModel = EmojiMemoryGame()
    
    @AppStorage("isOnboarding") private var isOnboarding:Bool = true
    var body: some Scene {
        WindowGroup {
            if isOnboarding {
             OnBoardingView()
            }
            else{
                ContentView()
            }
        }
    }
}
