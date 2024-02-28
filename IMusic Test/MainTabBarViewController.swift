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
        
        view.backgroundColor = .white
        tabBar.tintColor = .systemPink
        
        viewControllers = [
            generateviewController(rootViewController: SearchViewController(), systemImage: "magnifyingglass", title: "Search"),
            generateviewController(rootViewController: ViewController(), systemImage: "building.columns", title: "Library")
        ]
    }
    
    private func generateviewController(rootViewController: UIViewController, systemImage: String, title: String) -> UIViewController{
        let navigationVC = UINavigationController(rootViewController: rootViewController)
        navigationVC.tabBarItem.image = UIImage(systemName: "\(systemImage)")
        navigationVC.tabBarItem.title = title
        navigationVC.navigationBar.prefersLargeTitles = true
        
        rootViewController.navigationItem.title = title
        return navigationVC
    }
}
