//
//  OrderScreenPresenter.swift
//  CoffeeShop
//
//  Created by Александр Богачев on 27.08.24.
//

import UIKit

protocol OrderPresenterProtocol: AnyObject {
    
    func setImage(_ image: UIImage)
}

class OrderScreenPresenter: OrderPresenterProtocol {
   
    
    var view: HalfScreenViewProtocol?
    
    init(view: HalfScreenViewProtocol) {
        self.view = view
    }
   
    func setImage(_ image: UIImage) {
        view?.setImage(image: image)
    }
    
}
