//
//  GameView.swift
//  FlipSide
//
//  Created by Desi Rorie on 7/12/23.
//

import SwiftUI

struct GameView: View {
    
    let game = EmojiMemoryGame()
    
    @State private var isAnimating:Bool = false
    @State private var isActive:Bool = false
    var body: some View {
        NavigationStack {
            ZStack {
                VStack {
                    if isActive{
                        EmptyView()
                    } else{
                        Spacer()
                        Text("Welcome To FlipSide")
                            .font(.largeTitle)
                            .fontDesign(.serif)
                    }
                    
                    if isActive {
                        GamePlayView(viewModel: game)
                            .padding(.vertical,40)
                    } else {
                        StartButton(isAnimating: $isAnimating, isActive: $isActive)
                    }
                        
                    
                    
                    Spacer()
                    
                    
                }
            }.ignoresSafeArea(.all)
                .onAppear{
                    isAnimating = true
                }
        }
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
    }
}

struct StartButton: View {
    @Binding var isAnimating:Bool
    @Binding var isActive:Bool
    var body: some View {
        Button {
            isActive = true
        } label: {
            Text("Start Game")
        }
        .padding()
        .background(Color("OnboardingColor"))
        
        .foregroundColor(.black)
        .fontDesign(.monospaced)
        .border(.black, width: 2.6)
        .cornerRadius(3)
        .scaleEffect(isAnimating ? 0.8 : 1)
        .animation(.easeOut(duration: 2).repeatForever())
        
        
        
    }
}
