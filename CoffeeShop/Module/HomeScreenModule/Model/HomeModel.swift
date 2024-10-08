//
//  HomeModel.swift
//  CoffeeShop
//
//  Created by Александр Богачев on 27.08.24.
//

import Foundation


struct ImageModel {
    let imageName: String
    let description: String
    let price: Double
    let coffeeType: String
}

let imageArray: [ImageModel] = [
    ImageModel(imageName: "image1", description: "image1 description", price: 4.5, coffeeType: "Popular"),
    ImageModel(imageName: "image2", description: "image2 description", price: 4.0, coffeeType: "Popular"),
    ImageModel(imageName: "image3", description: "image3 description", price: 3.5, coffeeType: "Winter special"),
    ImageModel(imageName: "image4", description: "image4 description", price: 4.9, coffeeType: "DECAFF"),
    ImageModel(imageName: "image5", description: "image5 description", price: 4.5, coffeeType: "CHOCOLATE"),
    ImageModel(imageName: "image6", description: "image6 description", price: 4.0, coffeeType: "Black coffee"),
    ImageModel(imageName: "image7", description: "image7 description", price: 4.5, coffeeType: "Black coffee"),
    ImageModel(imageName: "image8", description: "image8 description", price: 4.9, coffeeType: "Black coffee"),
    ImageModel(imageName: "image9", description: "image9 description", price: 4.5, coffeeType: "CHOCOLATE"),
    ImageModel(imageName: "image1", description: "image1 description", price: 4.5, coffeeType: "Popular"),
    ImageModel(imageName: "image2", description: "image2 description", price: 4.0, coffeeType: "Popular"),
    ImageModel(imageName: "image3", description: "image3 description", price: 3.5, coffeeType: "Winter special"),
    ImageModel(imageName: "image4", description: "image4 description", price: 4.9, coffeeType: "DECAFF"),
    ImageModel(imageName: "image5", description: "image5 description", price: 4.5, coffeeType: "CHOCOLATE"),
    ImageModel(imageName: "image6", description: "image6 description", price: 4.0, coffeeType: "Black coffee"),
    ImageModel(imageName: "image7", description: "image7 description", price: 4.5, coffeeType: "Black coffee"),
    ImageModel(imageName: "image8", description: "image8 description", price: 4.9, coffeeType: "Black coffee"),
    ImageModel(imageName: "image9", description: "image9 description", price: 4.5, coffeeType: "CHOCOLATE"),
]

struct СoffeeModel {
    var coffeeName: String
}

let coffeeArray: [СoffeeModel] = [
    СoffeeModel(coffeeName: "All coffee"),
    СoffeeModel(coffeeName: "Popular"),
    СoffeeModel(coffeeName: "Black coffee"),
    СoffeeModel(coffeeName: "Winter special"),
    СoffeeModel(coffeeName: "DECAFF"),
    СoffeeModel(coffeeName: "CHOCOLATE"),
]

