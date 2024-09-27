//
//  CartPresenter.swift
//  CoffeeShop
//
//  Created by Александр Богачев on 5.09.24.

import Foundation

protocol CartPresenterProtocol: AnyObject {
    func getCartItems() -> [CartModel]
    func loadCartItemsFromJson()
    func clearButtonPressed()
    func updateCartItems(_ items: [CartModel])
}

class CartPresenter {
    
    weak var view: CartViewController?
    private var cartItems: [CartModel] = []
    
    init(view: CartViewController) {
        self.view = view
        loadCartItemsFromJson()
    }
}

extension CartPresenter: CartPresenterProtocol {
    
    func getCartItems() -> [CartModel] {
        return cartItems
    }
    
    func updateCartItems(_ items: [CartModel]) {
        cartItems = items
        JsonFileManager.shared.save(cartItems, to: "cartItems.json")
    }
    
    func clearButtonPressed() {
        cartItems.removeAll()
        JsonFileManager.shared.save(cartItems, to: "cartItems.json")
        view?.orderCollection.reloadData()
    }
    
    func loadCartItemsFromJson() {
        cartItems = JsonFileManager.shared.load(from: "cartItems.json", as: CartModel.self) ?? []
        print("Loaded favorite items from file: \(cartItems)")
    }
}
