//
//  LoginPresenter.swift
//  CoffeeShop
//
//  Created by Александр Богачев on 26.08.24.
//
import Foundation

protocol LoginViewOutput: AnyObject {
    func loginViewFinish()
}

class LoginViewPresenter: LoginViewOutput {
    
    weak var coordinator: LoginCoordinator!
    
    init(coordinator: LoginCoordinator!) {
        self.coordinator = coordinator
    }
    
    func loginViewFinish() {
        coordinator.finish()
    }
    
    
}

