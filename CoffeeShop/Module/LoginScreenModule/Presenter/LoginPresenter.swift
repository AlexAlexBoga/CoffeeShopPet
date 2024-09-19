//
//  LoginPresenter.swift
//  CoffeeShop
//
//  Created by Александр Богачев on 26.08.24.
//
import Foundation

protocol LoginViewOutput: AnyObject {
    func goToHomeVC()
    func goToProfileVC()
    func loginUser(with email: String, password: String)
}

class LoginViewPresenter: LoginViewOutput {
  
    weak var coordinator: LoginCoordinator!
    private let userManager = UserManager()
    
    init(coordinator: LoginCoordinator!) {
        self.coordinator = coordinator
    }
    
    func goToHomeVC() {
        coordinator.finish()
    }
    func goToProfileVC() {
        coordinator.nextProfile()
    }
    
    func loginUser(with email: String, password: String) {
        if userManager.validateUser(email: email, password: password) {
            coordinator.finish() } else {
                print("Invalid email or password")
            }
    }
    
}

