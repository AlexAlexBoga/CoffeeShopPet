//
//  AppCoordinator.swift
//  CoffeeShop
//
//  Created by Александр Богачев on 26.08.24.
//

import UIKit

class AppCoordinator: Coordinator, TabBarCoordinator {
    var tabBarController: UITabBarController?
    
    private let userStorage = UserStorage.shared
    
    override func start() {
//        if userStorage.passedOnboarding {
//            showMainFlow()
//        } else {
//            showFirstFlow()
//        }
//        showFirstFlow()
//        showLoginFlow()
        showMainFlow()
//        showAccountScreen()
    }
    
    override func finish() {
        print("AppCoordinator finish")
    }
}

// MARK: - navigation methods
private extension AppCoordinator {
    func showFirstFlow() {
        guard let navigationController = navigationController else { return }
        let firstCoordinator = FirstCoordinator(type: .first, navigationController: navigationController, finishDelegate: self)
        addChildCoordinator(firstCoordinator)
        firstCoordinator.start()
    }
    
    func showLoginScreen() {
        guard let navigationController = navigationController else { return }
        let loginCoordinator = LoginCoordinator(type: .login, navigationController: navigationController, finishDelegate: self)
        addChildCoordinator(loginCoordinator)
        loginCoordinator.start()
    }
    
    func showProfileScreen() {
        guard let navigationController = navigationController else { return }
        let profileCoordinator = ProfileCoordinator(type: .profile, navigationController: navigationController, finishDelegate: self)
        addChildCoordinator(profileCoordinator)
        profileCoordinator.start()
    }
    
    func showOrderScreen() {
        guard let navigationController = navigationController else { return }
        let orderCoordinator = OrderCoordinator(type: .order, navigationController: navigationController, finishDelegate: self)
        addChildCoordinator(orderCoordinator)
        orderCoordinator.start()
    }
    
    func showAccountScreen() {
        guard let navigationController = navigationController else { return }
        let accountCoordinator = AccountCoordinator(type: .account, navigationController: navigationController, finishDelegate: self)
        addChildCoordinator(accountCoordinator)
        accountCoordinator.start()
    }
    
    func showMainFlow() {
        guard let navigationController = navigationController else { return }
        
        let homeNavigationController = UINavigationController()
        let homeCoordinator = HomeCoordinator(type: .home, navigationController: homeNavigationController)
        homeNavigationController.tabBarItem = UITabBarItem(title: "Home", image: UIImage(resource: .home), tag: 0)
        homeCoordinator.finishDelegate = self
        homeCoordinator.start()
        
        let cartNavigationController = UINavigationController()
        let cartCoordinator = CartCoordinator(type: .home, navigationController: cartNavigationController)
        cartNavigationController.tabBarItem = UITabBarItem(title: "Cart", image: UIImage(resource: .cart), tag: 1)
        cartCoordinator.finishDelegate = self
        cartCoordinator.start()
        
        let favoriteNavigationController = UINavigationController()
        let favoriteCoordinator = FavoriteCoordinator(type: .home, navigationController: favoriteNavigationController)
        favoriteNavigationController.tabBarItem = UITabBarItem(title: "Favorite", image: UIImage(resource: .heart), tag: 2)
        favoriteCoordinator.finishDelegate = self
        favoriteCoordinator.start()
        
        let profileNavigationController = UINavigationController()
        let profileCoordinator = ProfileCoordinator(type: .home, navigationController: profileNavigationController)
        profileNavigationController.tabBarItem = UITabBarItem(title: "Profile", image: UIImage(resource: .user), tag: 3)
        profileCoordinator.finishDelegate = self
        profileCoordinator.start()
        
        addChildCoordinator(homeCoordinator)
        addChildCoordinator(cartCoordinator)
        addChildCoordinator(favoriteCoordinator)
        addChildCoordinator(profileCoordinator)
        
        let tabBarControllers = [homeNavigationController, cartNavigationController, favoriteNavigationController, profileNavigationController]
        
        let tabBarController = TabBarController(tabBarControllers: tabBarControllers)
        
        navigationController.pushViewController(tabBarController, animated: true)
    }
}

extension AppCoordinator: CoordinatorFinishDelegate {
    func coordinatorDidFinish(childeCoordinators: CoordinatorProtocol) {
        removeChildCoordinator(childeCoordinators)
        switch childeCoordinators.type {
        case .first:
            showLoginScreen()
            navigationController?.viewControllers = [navigationController?.viewControllers.last ?? UIViewController()]
        case .login:
            if let loginCoordinator = childeCoordinators as? LoginCoordinator, loginCoordinator.shouldShowProfile { showAccountScreen()
            } else {
                showMainFlow()
            }
            navigationController?.viewControllers = [navigationController?.viewControllers.last ?? UIViewController()]
        case .profile:
            showLoginScreen()
            navigationController?.viewControllers = [navigationController?.viewControllers.last ?? UIViewController()]
        case .home:
            showOrderScreen()
            navigationController?.viewControllers = [navigationController?.viewControllers.last ?? UIViewController()]
        case .account:
            navigationController?.viewControllers = [navigationController?.viewControllers.last ?? UIViewController()]

        case .app:
            return
        default:
            navigationController?.popToRootViewController(animated: false)
        }
    }
}
