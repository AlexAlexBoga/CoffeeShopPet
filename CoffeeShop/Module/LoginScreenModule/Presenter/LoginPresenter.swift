//
//  LoginPresenter.swift
//  CoffeeShop
//
//  Created by Александр Богачев on 26.08.24.
//

import Foundation

protocol LoginPresenterProtocol: AnyObject {
    func login(email: String, password: String)
}

class LoginPresenter: LoginPresenterProtocol {
    
    weak var view: LoginViewProtocol?
    private let coordinator: MainCoordinator?
    
    init(view: LoginViewProtocol?, coordinator: MainCoordinator?) {
        self.view = view
        self.coordinator = coordinator
    }
    
    func login(email: String, password: String) {
        
    }
    
}
