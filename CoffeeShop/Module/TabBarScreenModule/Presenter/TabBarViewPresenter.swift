//
//  HomeViewPresenter.swift
//  CoffeeShop
//
//  Created by Александр Богачев on 26.08.24.
//

import Foundation

protocol TabBarPresenterProtocol: AnyObject {
    func getPassword()
}

class TabBarViewPresenter: TabBarPresenterProtocol {
    
    weak var view: TabBarViewProtocol?
    
    init(view: TabBarViewProtocol) {
        self.view = view
    }
    
    func getPassword() {
        print("password")
    }
    
    
}
