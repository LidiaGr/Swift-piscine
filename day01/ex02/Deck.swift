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
}
