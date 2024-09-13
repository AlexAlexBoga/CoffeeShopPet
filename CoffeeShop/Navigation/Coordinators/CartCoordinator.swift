//
//  CartCoordinator.swift
//  CoffeeShop
//
//  Created by Александр Богачев on 31.08.24.
//
import UIKit

class CartCoordinator: Coordinator {
    
    override func start() {
        let vc = CartViewController()
        let presenter = CartPresenter(view: vc)
        vc.cartPresenter = presenter
        
        navigationController?.pushViewController(vc, animated: true)
    }
    
    override func finish() {
        print("AppCoordinator finish")
    }
}

