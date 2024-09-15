//
//  FavoritePresenter.swift
//  CoffeeShop
//
//  Created by Александр Богачев on 14.09.24.
//

import Foundation

protocol FavoritePresenterProtocol: AnyObject {
    func getFavoriteItem() -> [FavoriteModel]
    func updateCartItems(_ items: [FavoriteModel])
    func loadFavoriteItemsFromFile()
    
}

class FavoritePresenter {
    
    weak var view: FavoriteViewController?
    private var favoriteItem: [FavoriteModel] = []
    
    init(view: FavoriteViewController?) {
        self.view = view
        loadFavoriteItemsFromFile()
    }
}

extension FavoritePresenter: FavoritePresenterProtocol {
    
    func updateCartItems(_ items: [FavoriteModel]) {
        favoriteItem = items
        saveFavoriteItemsToFile(favoriteItem)
    }
    
    
    func getFavoriteItem() -> [FavoriteModel] {
        return favoriteItem
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
    
    func loadFavoriteItemsFromFile() {
        let fileManager = FileManager.default
        let urls = fileManager.urls(for: .documentDirectory, in: .userDomainMask)
        if let documentDirectory = urls.first {
            let fileURL = documentDirectory.appendingPathComponent("favoriteItems.json")
            do {
                let jsonData = try Data(contentsOf: fileURL)
                let jsonDecoder = JSONDecoder()
                let loadedFavoriteItems = try jsonDecoder.decode([FavoriteModel].self, from: jsonData)
                favoriteItem = loadedFavoriteItems
                print("Loaded cart items from JSON: \(loadedFavoriteItems)")
            } catch {
                print("Failed to load cart items from JSON file: \(error.localizedDescription)")
            }
        }
    }
  }


