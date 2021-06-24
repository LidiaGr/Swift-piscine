//
//  Tweet.swift
//  day04
//
//  Created by Lidia Grigoreva on 23.06.2021.
//

import UIKit

struct Visit: CustomStringConvertible {
    let host: String
    let begin_at: String
    let end_at: String
    
    var description: String {
        return "\(host):\n\(begin_at) - \(end_at)"
    }
}

//extension Date {
//        init(_ dateString: String) {
////            let dateStringFormatter = DateFormatter()
////            dateStringFormatter.timeZone = NSTimeZone.local
////            dateStringFormatter.locale = Locale(identifier: "en_US_POSIX")
////            dateStringFormatter.dateFormat = "yyyy'-'MM'-'dd'T'HH':'mm':'ssZZZ"
////            let date = dateStringFormatter.date(from: dateString)!
////            self.init(timeInterval: 0, since: date)
//            let dateFormatter = ISO8601DateFormatter()
//            let date = dateFormatter.date(from: dateString)!
//            self.init(timeInterval: 0, since: date)
//        }
//
//    func toString() -> String {
//        let dateFormatter: DateFormatter = DateFormatter()
//        dateFormatter.dateFormat = "d MMM, ''yy HH:mm"
//        let selectedDate: String = dateFormatter.string(from: self)
//        return selectedDate
//    }
//}

extension String {

    func toDate(withFormat format: String = "yyyy'-'MM'-'dd'T'HH':'mm':'ssZ")-> Date? {

        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = NSTimeZone.local
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.calendar = Calendar(identifier: .gregorian)
        dateFormatter.dateFormat = format
        let date = dateFormatter.date(from: self)

        print(date ?? "date not converted")
        return date

    }
}

extension Date {

    func toString(withFormat format: String = "EEEE ، d MMMM yyyy") -> String {

        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = NSTimeZone.local
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.calendar = Calendar(identifier: .gregorian)
        dateFormatter.dateFormat = format
        let str = dateFormatter.string(from: self)

        return str
    }
}
