//
//  HomePresenter.swift
//  CoffeeShop
//
//  Created by Александр Богачев on 27.08.24.
//

import UIKit

protocol HomePresenterProtocol: AnyObject {
    
}

class HomePresenter {
    
    weak var view: HomeViewProtocol?
    private let imageArray: [ImageModel]
    
    init(view: HomeViewProtocol?, imageArray: [ImageModel]) {
        self.view = view
        self.imageArray = imageArray
    }
    
}

extension HomePresenter: HomePresenterProtocol {
    
    
}
