//
//  FirstViewPresenter.swift
//  CoffeeShop
//
//  Created by Александр Богачев on 31.08.24.
//

import Foundation

protocol FirstViewOutput: AnyObject {
    func firstViewFinish()
}

class FirstViewPresenter: FirstViewOutput {
    
    private let userStorage = UserStorage.shared
    weak var coordinator: FirstCoordinator!
    
    init(coordinator: FirstCoordinator!) {
        self.coordinator = coordinator
    }
    
    func firstViewFinish() {
        userStorage.passedOnboarding = true
        coordinator.finish()
    }
}
