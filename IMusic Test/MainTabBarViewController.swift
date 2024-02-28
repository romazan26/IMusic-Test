//
//  MainTabBarViewController.swift
//  IMusic Test
//
//  Created by Роман on 28.02.2024.
//

import UIKit

class MainTabBarViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .gray
        
        let searchVC = SearchViewController()
        let navigationVC = UINavigationController(rootViewController: searchVC)
        let libraryVC = ViewController()
        
        navigationVC.tabBarItem.image = UIImage(systemName: "magnifyingglass")
        navigationVC.tabBarItem.title = "Search"
        navigationVC.navigationBar.prefersLargeTitles = true
        
        searchVC.navigationItem.title = "Search"
        
        
        viewControllers = [
            navigationVC,
            libraryVC
        ]
    }
}
