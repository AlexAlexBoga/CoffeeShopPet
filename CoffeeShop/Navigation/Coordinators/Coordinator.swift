//
//  Coordinator.swift
//  CoffeeShop
//
//  Created by Александр Богачев on 31.08.24.
//

import UIKit

enum CoordinatorType {
    case app
    case first
    case login
    case home
    case cart
    case favorite
    case profile
    case order
}

protocol CoordinatorProtocol: AnyObject {
    var childeCoordinators: [CoordinatorProtocol] { get set }
    var type: CoordinatorType { get }
    var navigationController: UINavigationController? { get set }
    var finishDelegate: CoordinatorFinishDelegate? { get set }
    
    func start()
    func finish()
    
}

// Добавление и удаление дочерних элементов в координатор
extension CoordinatorProtocol {
   
    func addChildCoordinator(_ childCoordinator: CoordinatorProtocol) {
        childeCoordinators.append(childCoordinator)
    }
    
    func removeChildCoordinator(_ childCoordinator: CoordinatorProtocol) {
        childeCoordinators = childeCoordinators.filter{ $0 !== childCoordinator} //Убирает текущий элемент
    }
}

// Имеет метод, который завершает координатор
protocol CoordinatorFinishDelegate: AnyObject {
    func coordinatorDidFinish(childeCoordinators: CoordinatorProtocol)
}

protocol TabBarCoordinator: AnyObject, CoordinatorProtocol {
    var tabBarController: UITabBarController? { get set }
}

class Coordinator: CoordinatorProtocol {
    var childeCoordinators: [CoordinatorProtocol]
    var type: CoordinatorType
    var navigationController: UINavigationController?
    weak var finishDelegate: (CoordinatorFinishDelegate)?
    
    init(childeCoordinators: [CoordinatorProtocol] = [CoordinatorProtocol](), type: CoordinatorType, navigationController: UINavigationController, finishDelegate: CoordinatorFinishDelegate? = nil) {
        self.childeCoordinators = childeCoordinators
        self.type = type
        self.navigationController = navigationController
        self.finishDelegate = finishDelegate
    }
    
    deinit {
        print("coordinator deinited \(type)")
        childeCoordinators.forEach{ $0.finishDelegate = nil} //удаляем ссылки на его завершение
        childeCoordinators.removeAll()
    }
    
    func start() {
        print("coordinator start")
    }
    
    func finish() {
        print("coordinator finish")
    }
    
    
}
