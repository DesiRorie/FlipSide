//
//  GamePlayView.swift
//  FlipSide>>>>
//
//  Created by Desi Rorie on 7/14/23.
//

import SwiftUI

struct GamePlayView: View {
    @ObservedObject var viewModel:EmojiMemoryGame
    
    
    
    var body: some View {
        ScrollView{
            VStack {
                HStack{
                    Text("Score: \(viewModel.score)").font(.largeTitle)
            }
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 90))]) {
                    ForEach(viewModel.cards) { card in
                        VStack{ZStack{
                        
                            CardView(card: card)
                                .frame( maxWidth: .infinity)
                                .aspectRatio(2/3, contentMode: .fit)
                                .foregroundColor(Color("OnboardingColor"))
                            VStack {
                                Text("Jelo")
                                    .foregroundColor(Color.clear)
                                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                            }                                    .onTapGesture {
                                viewModel.choose(card)
                        }
                        }
                        }
                    }
                    

                }
                Spacer().frame(height: 70)
                if viewModel.gamesisOver {

                    Button {
                        viewModel.resetGame()
                    } label: {
                        Text("Play Again?").foregroundColor(Color("OnboardingColor"))
                            .font(.largeTitle)
                    }

                                } else {
                                   
                                }
            }.padding(20)
              
            
        }
    }
    struct GamePlayView_Previews: PreviewProvider {
        static var previews: some View {
            let game = EmojiMemoryGame()
            GamePlayView(viewModel: game).preferredColorScheme(.dark)
            
            
        }
    }
}

