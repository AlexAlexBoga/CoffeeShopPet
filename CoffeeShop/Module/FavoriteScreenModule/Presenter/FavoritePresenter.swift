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
    
    func getFavoriteItem() -> [FavoriteModel] {
        return favoriteItem
    }
    
    func updateCartItems(_ items: [FavoriteModel]) {
        favoriteItem = items
        JsonFileManager.shared.save(favoriteItem, to: "favoriteItems.json")
    }
    
    func loadFavoriteItemsFromFile() {
        favoriteItem = JsonFileManager.shared.load(from: "favoriteItems.json", as: FavoriteModel.self) ?? []
        print("Loaded favorite items from file: \(favoriteItem)")
    }
}
