//
//  TabBarViewController.swift
//  day05
//
//  Created by Lidia Grigoreva on 26.06.2021.
//

import UIKit

class TabBarViewController: UITabBarController {
    let mapVC = MapViewController()
    let tableVC = TableViewController()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        UITabBar.appearance().barTintColor = .systemBackground
        tabBar.tintColor = .systemBlue
        
        setupTabBar()
    }
    
    func setupTabBar() {
        self.viewControllers = [mapVC, tableVC]
        self.selectedIndex = 0

        self.viewControllers?[0].title = "Map"
        self.viewControllers?[0].tabBarItem.image = UIImage(systemName: "map")
        
        self.viewControllers?[1].title = "Places"
        self.viewControllers?[1].tabBarItem.image = UIImage(systemName: "mappin")
    }
}
