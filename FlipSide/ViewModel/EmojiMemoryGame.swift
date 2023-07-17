//
//  EmojiMemoryGame.swift
//  FlipSide
//
//  Created by Desi Rorie on 7/15/23.
//


import SwiftUI


class EmojiMemoryGame:ObservableObject{
   static var emojis = ["🐶","🦊","🐱","🐻","🐭","🐼","🐹","🐻‍❄️","🐰","🐨"]

   static func createMemoryGame() -> MemoryGame<String>{
       

       return MemoryGame<String>(numberOfPairsOfCards: 6) {pairIndex in
            emojis[pairIndex]
            }
    }

    @Published private var model:MemoryGame<String> = createMemoryGame()
    
    var score:Int{
        model.score
    }
    var gamesisOver:Bool {
        model.gameisOver
    }
    var cards: Array<MemoryGame<String>.Card>{
       model.cards
    }
    var resetGame: () -> Void = {}
    
    init() {
        resetGame = { [weak self] in
            self?.model.resetGame()
        }
    }
   
  
    func choose(_ card:MemoryGame<String>.Card){
      model.choose(card)
        
    }

}
