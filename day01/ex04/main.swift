//
//  main.swift
//  day01
//
//  Created by Lidia Grigoreva on 10/06/2021.
//  Copyright © 2021 11. All rights reserved.
//

let deck1 = Deck(sorted: false)
let deck2 = Deck(sorted: true)

print("--- Create deck ---")
print("deck1 mixed after description call = \(deck1.description)")
print()
print("deck2 sorted after description call = \(deck2.description)")
print()

print("--- Draw card ---")
print("Draw one card from sorted deck: \(String(describing: deck2.draw()))")
print("Draw another card from sorted deck: \(String(describing: deck2.draw()))")
print("Outs after draw call = \(deck2.outs)")
print()
print("Cards after draw call = \(deck2.cards)")
print()

print("--- Fold card ---")
let card1 = deck2.outs[0]
deck2.fold(c: card1)
print("Disards after fold call = \(deck2.disards)")
print("Outs after fold call = \(deck2.outs)")
print()

print("--- Out of Bound ---")
for _ in 0...50 {
    deck1.draw()
}
deck1.draw() // last element
deck1.draw() // deck1 is already empty, program does not crash
print(deck1.description)
