//
//  Tweet.swift
//  day04
//
//  Created by Lidia Grigoreva on 23.06.2021.
//

struct Visit: CustomStringConvertible {
    let host: String
    let begin_at: String
    let end_at: String
    
    var description: String {
        return "\(host):\n\(begin_at) - \(end_at)"
    }
}
