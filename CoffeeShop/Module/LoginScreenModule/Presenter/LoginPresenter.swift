//
//  LoginPresenter.swift
//  CoffeeShop
//
//  Created by Александр Богачев on 26.08.24.
//
import Foundation

protocol LoginViewOutput: AnyObject {
    func goToHomeVC()
    func goToAccountVC()
}

class LoginViewPresenter: LoginViewOutput {
   
    weak var coordinator: LoginCoordinator!
    
    init(coordinator: LoginCoordinator!) {
        self.coordinator = coordinator
    }
    
    func goToHomeVC() {
        coordinator.finish()
    }
    func goToAccountVC() {
        coordinator.nextProfile()
    }
    
    
    
}

