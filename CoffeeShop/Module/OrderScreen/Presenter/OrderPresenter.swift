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
    
    init(view: OrderViewController?, image: UIImage?, coffeeName: String?, selectedImageName: String?, coffeeType: String?, coffeePrice: Double?) {
        self.selectedImage = image
        self.coffeeName = coffeeName
        self.selectedImageName = selectedImageName
        self.coffeeType = coffeeType
        self.coffeePrice = coffeePrice
    }
   
}

extension OrderPresenter: OrderPresenterProtocol {
 
    func setSelectedFirstPrice(_ price: Double?) -> Double {
        if !isFirstPriceSelected {
               isFirstPriceSelected = true
               coffeePrice = (coffeePrice ?? 0) + 0.53
           }
           return coffeePrice ?? 0
    }
    
    func setSelectedSecondPrice(_ price: Double?) -> Double {
        if !isSecondPriceSelected {
               isSecondPriceSelected = true
               coffeePrice = (coffeePrice ?? 0) + 0.74
           }
           return coffeePrice ?? 0
    }
    
    func setSelectedThirdPrice(_ price: Double?) -> Double {
        if !isThirdPriceSelected {
               isThirdPriceSelected = true
               coffeePrice = (coffeePrice ?? 0) + 0.92
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
        let newFavoriteItem = FavoriteModel(imageName: getSelectedImageName() ?? "", description: getSelectedCoffeeName() ?? "", price: getCoffeePrice() ?? 0, coffeeType: getCoffeeType() ?? "")
        
        var favoriteItem = loadFavoriteItemsFromFile() ?? []
        favoriteItem.append(newFavoriteItem)
        saveFavoriteItemsToFile(favoriteItem)
    }
    
    private func saveFavoriteItemsToFile(_ favoriteItems: [FavoriteModel]) {
        let jsonEncoder = JSONEncoder()
        jsonEncoder.outputFormatting = .prettyPrinted
        
        do {
            let jsonData = try jsonEncoder.encode(favoriteItems)
            saveJsonToFavoriteFile(jsonData: jsonData)
        } catch {
            print("Failed to encode cart items: \(error.localizedDescription)")
        }
    }
    
    private func saveJsonToFavoriteFile(jsonData: Data) {
        let fileManager = FileManager.default
        let urls = fileManager.urls(for: .documentDirectory, in: .userDomainMask)
        if let documentDirectory = urls.first {
            let fileURL = documentDirectory.appendingPathComponent("favoriteItems.json")
            do {
                try jsonData.write(to: fileURL)
                print("JSON saved to: \(fileURL.absoluteURL)")
            } catch {
                print("Failed to save JSON to file: \(error.localizedDescription)")
            }
        }
    }
    
    private func loadFavoriteItemsFromFile() -> [FavoriteModel]? {
        let fileManager = FileManager.default
        let urls = fileManager.urls(for: .documentDirectory, in: .userDomainMask)
        if let documentDirectory = urls.first {
            let fileURL = documentDirectory.appendingPathComponent("favoriteItems.json")
            do {
                let data = try Data(contentsOf: fileURL)
                let jsonDecoder = JSONDecoder()
                let favoriteItems = try jsonDecoder.decode([FavoriteModel].self, from: data)
                return favoriteItems
            } catch {
                if (error as NSError).code == NSFileReadNoSuchFileError {
                    print("No existing cart items file found, a new one will be created.")
                } else {
                    print("Failed to load or decode cart items: \(error.localizedDescription)")
                }
            }
        }
        return nil
    }
   
    func addToCartButtonPressed() {
        let cartItem = CartModel(imageName: getSelectedImageName() ?? "", description: getSelectedCoffeeName() ?? "", price: getCoffeePrice() ?? 0, coffeeType: getCoffeeType() ?? "")
        
        var cartItems = loadCartItemsFromFile() ?? []
        cartItems.append(cartItem)
        saveCartItemsToFile(cartItems)
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
    
    private func loadCartItemsFromFile() -> [CartModel]? {
        let fileManager = FileManager.default
        let urls = fileManager.urls(for: .documentDirectory, in: .userDomainMask)
        if let documentDirectory = urls.first {
            let fileURL = documentDirectory.appendingPathComponent("cartItems.json")
            do {
                let data = try Data(contentsOf: fileURL)
                let jsonDecoder = JSONDecoder()
                let cartItems = try jsonDecoder.decode([CartModel].self, from: data)
                return cartItems
            } catch {
                if (error as NSError).code == NSFileReadNoSuchFileError {
                    print("No existing cart items file found, a new one will be created.")
                } else {
                    print("Failed to load or decode cart items: \(error.localizedDescription)")
                }
            }
        }
        return nil
    }
}
