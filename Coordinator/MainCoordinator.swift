//
//  MainCoordinator.swift
//  CoffeeShop
//
//  Created by Александр Богачев on 26.08.24.
//

import UIKit

class MainCoordinator: Coordinator {
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let firstViewController = FirstViewController()
        firstViewController.coordinator = self
        navigationController.pushViewController(firstViewController, animated: false)
    }
    
    func showLoginScreen() {
        let loginViewController = LoginViewController()
        let presenter = LoginPresenter(view: loginViewController, coordinator: self)
        loginViewController.presenter = presenter
        loginViewController.coordinator = self
        navigationController.pushViewController(loginViewController, animated: true)
    }
 
    func showNextScreen() {
        
    }
}
