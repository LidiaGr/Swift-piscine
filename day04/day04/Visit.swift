//
//  Tweet.swift
//  day04
//
//  Created by Lidia Grigoreva on 23.06.2021.
//

import UIKit

struct Visit: CustomStringConvertible {
    let host: String
    var begin_at: String
    let end_at: String
    let date: String
    
    var description: String {
        return "\(date)\n\(begin_at) - \(end_at)\n\(host)"
    }
}

extension String {

    func toDate() -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = NSTimeZone.local
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        let date = dateFormatter.date(from: self)
        return date
    }
}

extension Date {

    func toString(withFormat format: String) -> String {

        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = NSTimeZone.local
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.dateFormat = format
        let str = dateFormatter.string(from: self)

        return str
    }
}
