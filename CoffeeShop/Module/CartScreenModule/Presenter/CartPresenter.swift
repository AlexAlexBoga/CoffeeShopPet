//
//  CartPresenter.swift
//  CoffeeShop
//
//  Created by Александр Богачев on 5.09.24.
//


import UIKit

protocol CartPresenterProtocol: AnyObject {
    
    func addToCart(item: CartModel)
    
}

class CartPresenter {
    
    weak var view: OrderViewController?

    private var cartItems: [CartModel] = []
    
//    init()

}

extension CartPresenter: CartPresenterProtocol {
    
    func addToCart(item: CartModel) {
        cartItems.append(item)
    }
    
}

