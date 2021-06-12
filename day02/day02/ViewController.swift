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
    var navBar = UINavigationBar()
    
    var allCharacters = CharacterAPI.getCharacters()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        setupNavigationBar()
        setupTableView()
    }
    
    func setupTableView() {
        view.addSubview(tableView)
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: navBar.bottomAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(CharacterTableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    func setupNavigationBar() {
        let screenSize: CGRect = UIScreen.main.bounds
        navBar = UINavigationBar(frame: CGRect(x: 0, y: 40, width: screenSize.width, height: 44))
        let navItem = UINavigationItem(title: "Death Note")
        let addItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.add, target: nil, action: #selector(add))
        navItem.rightBarButtonItem = addItem
        navBar.setItems([navItem], animated: false)

        self.view.addSubview(navBar)
//        navBar.translatesAutoresizingMaskIntoConstraints = false
//        navBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        
    }
    
    @objc func add() {

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

