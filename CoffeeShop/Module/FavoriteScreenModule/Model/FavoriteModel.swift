//
//  FavoriteModel.swift
//  CoffeeShop
//
//  Created by Александр Богачев on 14.09.24.
//

import Foundation

struct FavoriteModel: Codable {
    let imageName: String
    let description: String
    let price: Double
    let coffeeType: String
}
