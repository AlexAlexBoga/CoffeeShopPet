//
//  OrderPresenter.swift
//  CoffeeShop
//
//  Created by Александр Богачев on 27.08.24.
//

import UIKit

protocol OrderPresenterProtocol: AnyObject {
    func getSelectedImage() -> UIImage?
    func getSelectedCoffeeName() -> String?
}

class OrderPresenter {
    
    weak var view: OrderViewController?
    private var selectedImage: UIImage?
    private var coffeeName: String?
    
    init(view: OrderViewController?, image: UIImage?, coffeeName: String?) {
        self.selectedImage = image
        self.coffeeName = coffeeName
    }

}

extension OrderPresenter: OrderPresenterProtocol {

    func getSelectedCoffeeName() -> String? {
        return coffeeName
    }
    
    func getSelectedImage() -> UIImage? {
        return selectedImage
    }

}

