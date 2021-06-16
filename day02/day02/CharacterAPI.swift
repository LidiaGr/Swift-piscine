//
//  CharacterAPI.swift
//  day02
//
//  Created by Temple Tarsha on 6/11/21.
//  Copyright © 2021 Temple Tarsha. All rights reserved.
//

import UIKit

class CharacterAPI {
	static func getCharacters() -> [Character] {
		let allCharacters = [
            Character(name: "Ramsay Bolton", description: String("eaten by his own hounds"), date: Date("10/06/18 22:40").toString()),
            Character(name: "Joffrey Baratheon", description: String("poisoned at own wedding"), date: Date("04/02/18 12:34").toString()),
            Character(name: "The Night King", description: String("stabbed with a Valyrian steel dagger"), date: Date("08/03/18 19:00").toString())
		]
		return allCharacters
	}
}

extension Date {
    init(_ dateString:String) {
        let dateStringFormatter = DateFormatter()
        dateStringFormatter.dateFormat = "dd/MM/yy HH:mm"
        dateStringFormatter.timeZone = NSTimeZone.local
        dateStringFormatter.locale = NSLocale(localeIdentifier: "en_US_POSIX") as Locale
        let date = dateStringFormatter.date(from: dateString)!
        self.init(timeInterval:0, since:date)
    }
    
    func toString() -> String {
        let dateFormatter: DateFormatter = DateFormatter()
        dateFormatter.dateFormat = "d MMM, ''yy HH:mm"
        let selectedDate: String = dateFormatter.string(from: self)
        return selectedDate
    }
}
