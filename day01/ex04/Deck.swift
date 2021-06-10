//
//  Deck.swift
//  day01
//
//  Created by Lidia Grigoreva on 09/06/2021.
//  Copyright © 2021 11. All rights reserved.
//

import Foundation

class Deck: NSObject {
    static let allSpades : [Card] = Value.allValues.map({Card(c: Color.spade, v: $0)})
    static let allDiamonds : [Card] = Value.allValues.map({Card(c: Color.diamond, v: $0)})
    static let allHearts : [Card] = Value.allValues.map({Card(c: Color.heart, v: $0)})
    static let allClubs : [Card] = Value.allValues.map({Card(c: Color.club, v: $0)})
    
    static let allCards : [Card] = allSpades + allDiamonds + allHearts + allClubs
    
    var cards : [Card]
    var disards : [Card]
    var outs : [Card]
    
    init(sorted: Bool) {
        if sorted == true {
            cards = Deck.allCards
        } else {
            cards = Deck.allCards.shuffleRandom()
        }
        disards = Array()
        outs = Array()
    }
    
    override var description: String {
        return cards.description
    }
    
    func draw() -> Card {
        let tmp : Card = cards.removeFirst()
        outs.append(tmp)
        return tmp
    }
    
    func fold(c: Card) {
        if outs.contains(c) {
            disards.append(c)
            outs.remove(at: outs.firstIndex(of: c)!)
        }
    }
}

extension Array {
    func shuffleRandom() -> Array {
        let size = self.count
        var flags = [Bool] (repeating: false, count: size)
        var res = Array()
        var counter = 0;
        while (counter < size) {
            let num = Int(arc4random_uniform(UInt32(self.count)))
            if (flags[num] == false) {
                flags[num] = true
                res.append(self[num])
                counter += 1
            }
        }
        return res
    }
}
