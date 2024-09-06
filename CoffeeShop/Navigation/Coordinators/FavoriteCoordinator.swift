//
//  FavoriteCoordinator.swift
//  CoffeeShop
//
//  Created by Александр Богачев on 31.08.24.
//
import UIKit

class FavoriteCoordinator: Coordinator {
    
    override func start() {
        let vc = FavoriteViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    override func finish() {
        print("AppCoordinator finish")
    }
}


