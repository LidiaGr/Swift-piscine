//
//  TableViewTableViewController.swift
//  day05
//
//  Created by Lidia Grigoreva on 26.06.2021.
//

import UIKit

class TableViewController: UITableViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setupTableView()
    }
    
    func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return PlacesAPI.getPlaces().count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = PlacesAPI.getPlaces()[indexPath.item].title
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let location = PlacesAPI.getPlaces()[indexPath.item]
        let vc = self.tabBarController?.viewControllers![0] as! MapViewController
        self.tabBarController?.selectedViewController = vc
        vc.goToPlace(place: location)
    }
}
