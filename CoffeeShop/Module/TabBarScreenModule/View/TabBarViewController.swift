//
//  HomeViewController.swift
//  CoffeeShop
//
//  Created by Александр Богачев on 26.08.24.
//

import UIKit

protocol TabBarViewProtocol: AnyObject {
    func displayTabBarController(_ tabBarController: UITabBarController)
}

class TabBarViewController: UIViewController, TabBarViewProtocol {
    
    var presenter: TabBarPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
        setupTabBar()
    }
    
    
    private func setupTabBar() {
        
        let firstViewController = HomeViewController()
        firstViewController.tabBarItem = UITabBarItem(title: "Home", image: UIImage(resource: .home), tag: 0)
        
        let secondViewController = CartViewController()
        secondViewController.tabBarItem = UITabBarItem(title: "Cart", image: UIImage(resource: .cart), tag: 1)
        
        let therdViewController = FavoriteViewController()
        therdViewController.tabBarItem = UITabBarItem(title: "Favorite", image: UIImage(resource: .heart), tag: 2)
        
        let fourthViewController = ProfileViewController()
        fourthViewController.tabBarItem = UITabBarItem(title: "Profile", image: UIImage(resource: .user), tag: 3)
        
        let tabBarController = TabBarController(tabBarControllers: [firstViewController, secondViewController,therdViewController,fourthViewController])
        
        displayTabBarController(tabBarController)
    }
    
    func displayTabBarController(_ tabBarController: UITabBarController) {
        addChild(tabBarController)
        view.addSubview(tabBarController.view)
        tabBarController.didMove(toParent: self)
        
        tabBarController.view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tabBarController.view.topAnchor.constraint(equalTo: view.topAnchor),
            tabBarController.view.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tabBarController.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tabBarController.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
    }
}


