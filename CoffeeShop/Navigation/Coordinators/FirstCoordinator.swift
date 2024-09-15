//
//  FirstCoordinator.swift
//  CoffeeShop
//
//  Created by Александр Богачев on 31.08.24.
//
import UIKit

class FirstCoordinator: Coordinator {
    
    override func start() {
        showFirst()
    }
    
    override func finish() {
        print("AppCoordinator finish")
        finishDelegate?.coordinatorDidFinish(childeCoordinators: self)
    }
}

private extension FirstCoordinator {
    func showFirst() {
        let presenter = FirstViewPresenter(coordinator: self)
        let viewController = FirstViewController(viewOutput: presenter)
        navigationController?.pushViewController(viewController, animated: true)
    }
}

