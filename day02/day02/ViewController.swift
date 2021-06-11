//
//  ViewController.swift
//  day02
//
//  Created by Temple Tarsha on 6/11/21.
//  Copyright © 2021 Temple Tarsha. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
	
	let tableView = UITableView()
	
	var allCharacters = CharacterAPI.getCharacters()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		view.backgroundColor = .white

		setupTableView()
	}
	
//	override func loadView() {
//		super.loadView()
//
//		view.backgroundColor = .white
//
//		setupTableView()
//	}

	func setupTableView() {
		view.addSubview(tableView)
		
		tableView.translatesAutoresizingMaskIntoConstraints = false
		tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
		tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
		tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
		tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
		
		tableView.dataSource = self
		tableView.delegate = self
		tableView.register(CharacterTableViewCell.self, forCellReuseIdentifier: "cell")
	}
	
}

extension ViewController : UITableViewDataSource {
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return allCharacters.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
	  let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CharacterTableViewCell
		let theCharacter = allCharacters[indexPath.row]
		cell.nameLabel.text = theCharacter.name
		cell.deathDescription.text = theCharacter.description
		cell.deathDate.text = theCharacter.date
		
//		let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
//		cell.textLabel!.text = allCharacters[indexPath.row].name
	  return cell
	}
}

extension ViewController :  UITableViewDelegate {
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		return 70
	}
}

