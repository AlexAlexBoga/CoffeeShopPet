//
//  OrderCoordinator.swift
//  CoffeeShop
//
//  Created by Александр Богачев on 1.09.24.
//

class OrderCoordinator: Coordinator {
    
    override func start() {
        showOrder()
    }
    
    override func finish() {
        print("AppCoordinator finish")
        finishDelegate?.coordinatorDidFinish(childeCoordinators: self)
    }
}

private extension OrderCoordinator {
    func showOrder() {
        let viewController = OrderViewController()
        navigationController?.pushViewController(viewController, animated: true)
    }
}

