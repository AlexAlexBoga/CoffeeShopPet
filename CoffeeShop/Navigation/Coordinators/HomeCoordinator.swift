//
//  HomeCoordinator.swift
//  CoffeeShop
//
//  Created by Александр Богачев on 31.08.24.
//

class HomeCoordinator: Coordinator {
    
    override func start() {
        let vc = HomeViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    override func finish() {
        print("AppCoordinator finish")
    }
}

