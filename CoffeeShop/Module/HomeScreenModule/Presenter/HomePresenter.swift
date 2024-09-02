//
//  HomePresenter.swift
//  CoffeeShop
//
//  Created by Александр Богачев on 27.08.24.
//

import UIKit

protocol HomePresenterProtocol: AnyObject {
    func getImageData() -> [ImageModel]
    func getCoffeeData() -> [СoffeeModel]
}

class HomePresenter {
    
    weak var view: HomeViewProtocol?
    private let imageArray: [ImageModel]
    private let coffeeArray: [СoffeeModel]
    
    init(view: HomeViewProtocol?, imageArray: [ImageModel], coffeeArray: [СoffeeModel]) {
        self.view = view
        self.imageArray = imageArray
        self.coffeeArray = coffeeArray
    }
   
}

extension HomePresenter: HomePresenterProtocol {
    
    func getImageData() -> [ImageModel] {
        return imageArray
    }
    
    func getCoffeeData() -> [СoffeeModel] {
        return coffeeArray
    }
    
}
    

