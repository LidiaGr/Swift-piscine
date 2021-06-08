enum Color: String, CaseIterable {
    case clubs = "green"
    case diamonds = "blue"
    case hearts = "red"
    case spades = "black"
    
    static let allColors : [Color] = Color.allCases
}
