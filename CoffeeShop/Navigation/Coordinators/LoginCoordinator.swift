//
//  LoginCoordinator.swift
//  CoffeeShop
//
//  Created by Александр Богачев on 31.08.24.
//

class LoginCoordinator: Coordinator {
    
    override func start() {
        showLogin()
    }
    
    override func finish() {
        print("AppCoordinator finish")
        finishDelegate?.coordinatorDidFinish(childeCoordinators: self)
    }
}

private extension LoginCoordinator {
    func showLogin() {
        let presenter = LoginViewPresenter(coordinator: self)
        let viewController = LoginViewController(viewOutput: presenter)
        navigationController?.pushViewController(viewController, animated: true)
    }
}

