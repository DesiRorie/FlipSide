//
//  CardView.swift
//  FlipSide
//
//  Created by Desi Rorie on 7/14/23.
//

import SwiftUI

struct CardView: View {
    let card:MemoryGame<String>.Card
    

    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 20)
            
            if card.isFaceUp{
                shape.fill(.white)
                shape.strokeBorder(lineWidth:3)
                
                Text(card.content).font(.largeTitle)
            }
            else if card.isMatched {
                shape.opacity(0)
            }
                else {
                shape.fill(Color("OnboardingColor"))
            }
        }.onTapGesture {
//            card.isFaceUp = !card.isFaceUp
        }
        
    }
}

struct CardView_Previews: PreviewProvider {
   
    static var previews: some View {
        let card = MemoryGame<String>.Card(isFaceUp: true,isMatched: true, content: "🐈‍⬛", id: 0)
       return CardView(card: card)
        
    }
}
