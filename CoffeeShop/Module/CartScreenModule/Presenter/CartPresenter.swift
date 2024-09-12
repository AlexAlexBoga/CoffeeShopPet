//
//  CartPresenter.swift
//  CoffeeShop
//
//  Created by Александр Богачев on 5.09.24.

import Foundation

protocol CartPresenterProtocol: AnyObject {
    func getCartItems() -> [CartModel]
    func loadCartItemsFromJson()
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
    
    func loadCartItemsFromJson() {
        let fileManager = FileManager.default
        let urls = fileManager.urls(for: .documentDirectory, in: .userDomainMask)
        if let documentDirectory = urls.first {
            let fileURL = documentDirectory.appendingPathComponent("cartItems.json")
            do {
                let jsonData = try Data(contentsOf: fileURL)
                let jsonDecoder = JSONDecoder()
                let loadedCartItems = try jsonDecoder.decode([CartModel].self, from: jsonData)
                cartItems = loadedCartItems
                print("Loaded cart items from JSON: \(loadedCartItems)")
            } catch {
                print("Failed to load cart items from JSON file: \(error.localizedDescription)")
            }
        }
    }
}
