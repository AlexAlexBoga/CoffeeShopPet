//
//  HalfScreenPresenter.swift
//  CoffeeShop
//
//  Created by Александр Богачев on 27.08.24.
//

import UIKit

protocol HalfScreenPresenterProtocol: AnyObject {
    
}

class HalfScreenPresenter: HalfScreenPresenterProtocol {
    var view: HalfScreenViewProtocol?
    
    init(view: HalfScreenViewProtocol) {
        self.view = view
    }
    
    
}
