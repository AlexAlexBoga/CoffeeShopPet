//
//  HomePresenter.swift
//  CoffeeShop
//
//  Created by Александр Богачев on 27.08.24.
//

import Foundation

protocol HomePresenterProtocol: AnyObject {
   
}

class HomePresenter: HomePresenterProtocol {
    
    weak var view: HomeViewProtocol?
    private let coordinator: MainCoordinator?
    
    init(view: HomeViewProtocol?, coordinator: MainCoordinator?) {
        self.view = view
        self.coordinator = coordinator
    }
    
   
    
}
