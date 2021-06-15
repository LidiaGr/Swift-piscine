//
//  ViewController.swift
//  day02
//
//  Created by Lidia Grigoreva on 15/06/2021.
//  Copyright © 2021 11. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var allCharacters = CharacterAPI.getCharacters()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        setupNavigationBar()
        setupTableView()
    }
    
    func setupNavigationBar() {
        self.title = "Death Note"
        
        let addItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.add, target: self, action: #selector(add))
        self.navigationItem.rightBarButtonItem = addItem
    }
    
    @objc func add() {
        let secondVC = SecondVC()
        navigationController?.pushViewController(secondVC, animated: false)
    }
    
    func setupTableView() {
        let tableView = UITableView()
        view.addSubview(tableView)
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allCharacters.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let theCharacter = allCharacters[indexPath.row]
        cell.textLabel?.numberOfLines = 0
        cell.textLabel!.text = "\(theCharacter.name!)\n\(theCharacter.date!)\n\(theCharacter.description!)"
        return cell
    }
}

