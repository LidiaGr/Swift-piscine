//
//  ViewController.swift
//  day02
//
//  Created by Lidia Grigoreva on 15/06/2021.
//  Copyright © 2021 11. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let tableView = UITableView()
    
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
        view.addSubview(tableView)
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(CharacterTableViewCell.self, forCellReuseIdentifier: "cell")
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return CharacterAPI.getCharacters().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let allCharacters = CharacterAPI.getCharacters()
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CharacterTableViewCell
        let theCharacter = allCharacters[indexPath.row]
        cell.nameLabel.text = "\(theCharacter.name)"
        cell.deathDate.text = "\(theCharacter.date)"
        cell.deathDescription.numberOfLines = 0
        cell.deathDescription.text = "\(theCharacter.description ?? "")"
        return cell
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
}

    
