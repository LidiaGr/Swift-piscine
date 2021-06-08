import Foundation

let card1 = Card(c : Color.spade, v : Value.ace)
//card1: Card = {
//    ObjectiveC.NSObject = {
//        isa = __lldb_expr_9.Card
//    }
//    color = spade
//    value = ace
//}
print(card1)
//(1, Spade)
let card2 = Card(c : Color.diamond, v: Value.two)
//card2: Card = {
//    ObjectiveC.NSObject = {
//        isa = __lldb_expr_9.Card
//    }
//    color = diamond
//    value = two
//}
print(card2)
//(2, Diamond)
print(card1 == card2)
//false
print()

let card3 = Card(c : Color.spade, v : Value.ace)
print("Is Card1 equals Card3? \(card1.isEqual(card3))")
print("Is Card1 equals Card3? \(card1 == card3)")
print("Card3 description: \(card3.description)")
print()

let card4 = Card(c: Color.heart, v: Value.queen)
print("Card4 description: \(card4.description)")
print("Is Card2 equals Card4? \(card2.isEqual(card4))")
print("Is Card3 equals Card4? \(card3 == card4)")
