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
    func getSelectedImageName() -> String?
    func addToCartButtonPressed()
    func setImageName(_ name: String?)
    func getCoffeeType() -> String?
    func getCoffeePrice() -> Double?
    func addToFavoriteButtonPressed()
    func setSelectedFirstPrice(_ price: Double?) -> Double
    func setSelectedSecondPrice(_ price: Double?) -> Double
    func setSelectedThirdPrice(_ price: Double?) -> Double
    func didUpdateCount(_ count: Int)
}

class OrderPresenter {
    
    weak var view: OrderViewController?
    private var selectedImage: UIImage?
    private var coffeeName: String?
    private var selectedImageName: String?
    private var coffeeType: String?
    private var coffeePrice: Double?
    
    private var isFirstPriceSelected = false
    private var isSecondPriceSelected = false
    private var isThirdPriceSelected = false
    private var isPriceSet = false
    private var currentCount: Int = 1
    private var totalPrice: Double = 0
    private var favoriteItem: [FavoriteModel] = []
    private var cartItems: [CartModel] = []
    
    init(view: OrderViewController?, image: UIImage?, coffeeName: String?, selectedImageName: String?, coffeeType: String?, coffeePrice: Double?) {
        self.selectedImage = image
        self.coffeeName = coffeeName
        self.selectedImageName = selectedImageName
        self.coffeeType = coffeeType
        self.coffeePrice = coffeePrice
        self.totalPrice = coffeePrice ?? 0
    }
}

extension OrderPresenter: OrderPresenterProtocol{
    
    func didUpdateCount(_ count: Int) {
        currentCount = count
        let newPrice = (coffeePrice ?? 0) * Double(currentCount)
        totalPrice = newPrice
        print("Current count is now \(currentCount)")
        print("Current price is now \(totalPrice)")
    }
    
    func setSelectedFirstPrice(_ price: Double?) -> Double {
        if !isPriceSet {
            if !isFirstPriceSelected {
                isFirstPriceSelected = true
                isPriceSet = true
                coffeePrice = (coffeePrice ?? 0) + 0.53
            }
        }
        return coffeePrice ?? 0
    }
    
    func setSelectedSecondPrice(_ price: Double?) -> Double {
        if !isPriceSet {
            if !isSecondPriceSelected {
                isSecondPriceSelected = true
                isPriceSet = true
                coffeePrice = (coffeePrice ?? 0) + 0.74
            }
        }
        return coffeePrice ?? 0
    }
    
    func setSelectedThirdPrice(_ price: Double?) -> Double {
        if !isPriceSet {
            if !isThirdPriceSelected {
                isThirdPriceSelected = true
                isPriceSet = true
                coffeePrice = (coffeePrice ?? 0) + 0.92
            }
        }
        return coffeePrice ?? 0
    }
    
    func getCoffeePrice() -> Double? {
        return coffeePrice
    }
    
    func getCoffeeType() -> String? {
        return coffeeType
    }
    
    func setImageName(_ name: String?) {
        selectedImageName = name
    }
    
    func getSelectedImageName() -> String? {
        return selectedImageName
    }
    
    func getSelectedCoffeeName() -> String? {
        return coffeeName
    }
    
    func getSelectedImage() -> UIImage? {
        return selectedImage
    }
    
    func addToFavoriteButtonPressed() {
        loadFavoriteItemsFromFile()
        
        let newFavoriteItem = FavoriteModel(imageName: getSelectedImageName() ?? "", description: getSelectedCoffeeName() ?? "", price: totalPrice, coffeeType: getCoffeeType() ?? "")
        
        favoriteItem.append(newFavoriteItem)
        saveFavoriteItemsToFile(favoriteItem)
    }
    
    private func saveFavoriteItemsToFile(_ favoriteItems: [FavoriteModel]) {
        JsonFileManager.shared.save(favoriteItems, to: "favoriteItems.json")
    }
    
    private func loadFavoriteItemsFromFile() {
        favoriteItem = JsonFileManager.shared.load(from: "favoriteItems.json", as: FavoriteModel.self) ?? []
    }
    
    func addToCartButtonPressed() {
        loadCartItemsFromFile()
        
        let cartItem = CartModel(imageName: getSelectedImageName() ?? "", description: getSelectedCoffeeName() ?? "", price: totalPrice, coffeeType: getCoffeeType() ?? "")
        
        cartItems.append(cartItem)
        saveCartItemsToFile(cartItems)
    }
    
    private func saveCartItemsToFile(_ cartItems: [CartModel]) {
        JsonFileManager.shared.save(cartItems, to: "cartItems.json")
    }
    
    private func loadCartItemsFromFile() {
        cartItems = JsonFileManager.shared.load(from: "cartItems.json", as: CartModel.self) ?? []
    }
}
