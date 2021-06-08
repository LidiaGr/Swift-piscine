enum Color: String, CaseIterable {
    case club = "green"
    case diamond = "blue"
    case heart = "red"
    case spade = "black"
    
    static let allColors : [Color] = Color.allCases
}
