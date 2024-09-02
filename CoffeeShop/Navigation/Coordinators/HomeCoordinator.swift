//
//  HomeCoordinator.swift
//  CoffeeShop
//
//  Created by Александр Богачев on 31.08.24.
//

class HomeCoordinator: Coordinator {
    
    override func start() {
        let vc = HomeViewController()
        let presenter = HomePresenter(view: vc, imageArray: imageArray, coffeeArray: coffeeArray)
        vc.presenter = presenter
        navigationController?.pushViewController(vc, animated: true)
    }
    
    override func finish() {
        print("AppCoordinator finish")
    }
}

