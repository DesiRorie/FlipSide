//
//  MemoryGame.swift
//  FlipSide
//
//  Created by Desi Rorie on 7/15/23.
//

import Foundation

struct MemoryGame<CardContent> where CardContent:Equatable {
    private(set) var cards: Array<Card>

    private var indexOfTheFacingCard: Int?
    var score = 0
    var gameisOver:Bool = false
    mutating func choose(_ card:Card){
        if let chosenIndex = cards.firstIndex(where: { $0.id == card.id}),
           !cards[chosenIndex].isFaceUp,
           !cards[chosenIndex].isMatched
        {
            if let potentialMatch = indexOfTheFacingCard{
                if cards[chosenIndex].content == cards[potentialMatch].content{
                    cards[chosenIndex].isMatched = true
                    cards[potentialMatch].isMatched = true
//                    if (score > 8)
//                    { score += 2}
//                    else if (score == 8){
//gameisOver = true
//                    }
                    
                    if (score >= 10){
                        gameisOver = true
//                      resetGame()
                        
                    } else {
                        score += 2
                    }
                }
                indexOfTheFacingCard = nil
            } else {
                for index in  cards.indices{
                    cards[index].isFaceUp = false
                }
                indexOfTheFacingCard = chosenIndex
            }
            
            cards[chosenIndex].isFaceUp.toggle()
        }
        print("\(cards)")
        
    }
    mutating func resetGame() {
        
        cards.indices.forEach { index in
            cards[index].isFaceUp = false
            cards[index].isMatched = false
        }
        
        indexOfTheFacingCard = nil
        score = 0
        gameisOver = false
    }
    
    
    init(numberOfPairsOfCards:Int, createCardContent: (Int) -> CardContent){
        cards = [Card]()
        //add number of pairs to cards array
        for pairindex in 0..<numberOfPairsOfCards {
            let content = createCardContent(pairindex)
            cards.append(Card(content:content,id: pairindex*2))
            cards.append(Card(content: content,id: pairindex*2+1))
            cards.shuffle()
        }
    }
    
    
    
    struct Card:Identifiable {
        
        var isFaceUp:Bool = false
        var isMatched:Bool = false
        var content: CardContent
        var id: Int
        //
        //        func flipTheCard() -> Bool{
        //            return !isFaceUp
        //        }
    }
}

