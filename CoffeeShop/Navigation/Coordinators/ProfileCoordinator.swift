//
//  ProfileCoordinator.swift
//  CoffeeShop
//
//  Created by Александр Богачев on 31.08.24.
//
import UIKit

class ProfileCoordinator: Coordinator {
    
    override func start() {
       showProfile()
    }
    
    override func finish() {
        print("AppCoordinator finish")
        finishDelegate?.coordinatorDidFinish(childeCoordinators: self)
        
    }
}

extension ProfileCoordinator {
    func showProfile() {
//        let presenter = ProfilePresenter(coordinator: self)
        let viewController = ProfileViewController()
        navigationController?.pushViewController(viewController, animated: true)
    }
}
