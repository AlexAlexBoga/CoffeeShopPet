//
//  CartModel.swift
//  CoffeeShop
//
//  Created by Александр Богачев on 5.09.24.
//
import Foundation

struct CartModel: Codable {
    let imageName: String
    let description: String
    let price: Double
    let coffeeType: String
}
