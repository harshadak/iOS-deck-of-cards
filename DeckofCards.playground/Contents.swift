//: Playground - noun: a place where people can play

import UIKit

struct Card{
    var color: String
    var roll: Int
}

class Deck {
    var cards = [Card]()
    
    init(){
        for _ in 0...9 {
            self.cards.append(Card(color: "Blue", roll: Int(arc4random_uniform(2)+1)))
            self.cards.append(Card(color: "Red", roll: Int(arc4random_uniform(2)+3)))
            self.cards.append(Card(color: "Green", roll: Int(arc4random_uniform(2)+5)))
        }
    }
    
    func deal() -> Card? {
        if self.cards.count > 0 {
            return self.cards.remove(at: 0)
        }
        else {
            return nil
        }
    }
    
    func isEmpty() -> Bool {
        if self.cards.count > 0{
        return false
        }
        else{
        return true
        }
    }
    
    func shuffle(){
            for i in stride(from: self.cards.count-1, to: 0, by: -1){
                let swapCardIndex = Int(arc4random_uniform(UInt32(i)))
                let temp = self.cards[i]
                self.cards[i] = self.cards[swapCardIndex]
                self.cards[swapCardIndex] = temp
        }
    }
}


class Player {
    var name: String
    var hand = [Card]()
    
    init(name: String){
        self.name = name
    }
    
    func draw(deck:Deck) -> Card? {
        if let drawnCard = deck.deal(){
            self.hand.append(drawnCard)
            return drawnCard
        } else {
            return nil
        }
    }
    
    func rollDice() -> Int {
        let random = arc4random_uniform(6)+1
        return Int(random)
    }
    
    func matchingCards(roll: Int, color: String) -> Int {
        var count: Int = 0
        for x in hand {
            if (roll == x.roll && color == x.color){
                count += 1
            }
        }
        print(count)
        return count
    }
}




var deck1 = Deck()
//print(deck1.cards)
//print(deck1.deal()!)
deck1.shuffle()
//print(deck1.deal())
//print(deck1.cards)
var player1 = Player(name: "Harshada")
////print(player1.rollDice())
////print(player1.draw(deck: deck1)!)
////print(deck1.cards)
player1.draw(deck: deck1)
player1.draw(deck: deck1)
player1.draw(deck: deck1)
//player1.draw(deck: deck1)
//player1.draw(deck: deck1)
//player1.draw(deck: deck1)
//print(player1.hand)
if let asdf = deck1.deal() {
    print(asdf)
    player1.matchingCards(roll: player1.rollDice(), color: asdf.color)
}
//print(player1.hand)












