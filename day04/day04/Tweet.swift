//
//  Tweet.swift
//  day04
//
//  Created by Lidia Grigoreva on 23.06.2021.
//

struct Tweet: CustomStringConvertible {
    var description: String {
        return "\(name): \(text)"
    }
    
    let name: String
    let text: String
}
