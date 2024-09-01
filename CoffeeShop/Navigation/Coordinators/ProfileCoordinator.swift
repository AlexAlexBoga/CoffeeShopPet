//
//  ProfileCoordinator.swift
//  CoffeeShop
//
//  Created by Александр Богачев on 31.08.24.
//

class ProfileCoordinator: Coordinator {
    
    override func start() {
        let vc = ProfileViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    override func finish() {
        print("AppCoordinator finish")
    }
}
