//
//  AccountCoordinator.swift
//  CoffeeShop
//
//  Created by Александр Богачев on 15.09.24.
//

import Foundation

class AccountCoordinator: Coordinator {
    
    override func start() {
        let vc = AccountViewController()
        
        navigationController?.pushViewController(vc, animated: true)
    }
    
    override func finish() {
        print("AppCoordinator finish")
    }
}
