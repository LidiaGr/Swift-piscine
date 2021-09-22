import Foundation

let allColors = Color.allColors
let allValues = Value.allValues

let card1 = Card(c: Color.heart, v: Value.six)

print("card1: \(card1)")

let card2 = Card(c: Color.club, v: Value.ace)
let card3 = Card(c: Color.club, v: Value.ace)

print("card2: \(card2)")
print("card3: \(card3)")

print("card1 == card2: \(card1 == card2)")
print("card2 == card3: \(card2 == card3)")


print(card2.isEqual(to: allColors))
print(card2.isEqual(to: card3))
