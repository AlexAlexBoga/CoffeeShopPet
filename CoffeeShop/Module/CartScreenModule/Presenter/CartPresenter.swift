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
   
    func updateCartItems(_ items: [CartModel]) {
        cartItems = items
        saveCartItemsToFile(cartItems)
    }
    
    
    func clearButtonPressed() {
        cartItems.removeAll()
        saveCartItemsToFile(cartItems)
        view?.orderCollection.reloadData()
    }
    
    func getCartItems() -> [CartModel] {
        return cartItems
    }
    
    private func saveCartItemsToFile(_ cartItems: [CartModel]) {
        let jsonEncoder = JSONEncoder()
        jsonEncoder.outputFormatting = .prettyPrinted
        
        do {
            let jsonData = try jsonEncoder.encode(cartItems)
            saveJsonToFile(jsonData: jsonData)
        } catch {
            print("Failed to encode cart items: \(error.localizedDescription)")
        }
    }
    
    private func saveJsonToFile(jsonData: Data) {
        let fileManager = FileManager.default
        let urls = fileManager.urls(for: .documentDirectory, in: .userDomainMask)
        if let documentDirectory = urls.first {
            let fileURL = documentDirectory.appendingPathComponent("cartItems.json")
            do {
                try jsonData.write(to: fileURL)
                print("JSON saved to: \(fileURL.absoluteURL)")
            } catch {
                print("Failed to save JSON to file: \(error.localizedDescription)")
            }
        }
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
