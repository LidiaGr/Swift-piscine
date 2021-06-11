//
//  CharacterAPI.swift
//  day02
//
//  Created by Temple Tarsha on 6/11/21.
//  Copyright © 2021 Temple Tarsha. All rights reserved.
//

class CharacterAPI {
	static func getCharacters() -> [Character] {
		let allCharacters = [
			Character(name: "Ramsay Bolton", description: "eaten by his own hounds", date: "6 season 09 episode"),
			Character(name: "Joffrey Baratheon", description: "poisoned", date: "4 season 02 episode"),
			Character(name: "The Night King", description: "stabbed with a Valyrian steel dagger", date: "8 season 03 episode")
		]
		return allCharacters
	}
}
