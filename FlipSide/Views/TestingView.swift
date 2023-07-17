//
//  TestingView.swift
//  FlipSide
//
//  Created by Desi Rorie on 7/15/23.
//

import SwiftUI

struct TestingView: View {
    @State private var change:Bool = false
    let viewModel:EmojiMemoryGame
    var body: some View {

            VStack{
                ForEach(viewModel.cards) { card in
                    CardView(card: card)
                        .onTapGesture {
                            change.toggle()
                        }
                        .aspectRatio(2/3, contentMode: .fit)
                    
                   
                }
                VStack{
                    Text(change ? "Works" : "Nope")
                }

            }
            .padding()
        .foregroundColor(Color("OnboardingColor"))

    }
}

struct TestingView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
        TestingView(viewModel: game)
    }
}
