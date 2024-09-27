//
//  AccountPresenter.swift
//  CoffeeShop
//
//  Created by Александр Богачев on 15.09.24.
//

import Foundation

protocol AccountPresenterProtocol: AnyObject {
    func registerUser(email: String, password: String, confirmPassword: String)
    func goToLogin()
}

class AccountPresenter {
    weak var view: AccountViewProtocol?
    private let userManager = UserManager()
    
    init(view: AccountViewProtocol?) {
        self.view = view
    }
    
}

extension AccountPresenter: AccountPresenterProtocol {
    
    func registerUser(email: String, password: String, confirmPassword: String) {
        if email.isEmpty || password.isEmpty || confirmPassword.isEmpty {
            view?.showError("All field is empty")
        }
        if password != confirmPassword {
            view?.showError("Password is wrong")
        }
        if userManager.isUserRegistered(email: email) {
            view?.showError("User with this email already exists")
        }
        userManager.saveUser(email: email, password: password)
        view?.showSuccess("Registration successful!")
    }
    
    func goToLogin() {
        
    }
    
}
