//
//  CartCoordinator.swift
//  CoffeeShop
//
//  Created by Александр Богачев on 31.08.24.
//

class CartCoordinator: Coordinator {
    
    override func start() {
        let vc = CartViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    override func finish() {
        print("AppCoordinator finish")
    }
}

