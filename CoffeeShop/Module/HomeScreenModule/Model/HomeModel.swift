//
//  HomeModel.swift
//  CoffeeShop
//
//  Created by Александр Богачев on 27.08.24.
//

import Foundation


struct ImageModel {
    var imageName: String
}

let imageArray: [ImageModel] = [
    ImageModel(imageName: "image1"),
    ImageModel(imageName: "image2"),
    ImageModel(imageName: "image3"),
    ImageModel(imageName: "image4"),
    ImageModel(imageName: "image1"),
    ImageModel(imageName: "image2"),
    ImageModel(imageName: "image3"),
    ImageModel(imageName: "image4"),
]

struct coffeeModel {
    var coffeeName: String
}

let coffeeArray: [coffeeModel] = [
    coffeeModel(coffeeName: "Popular"),
    coffeeModel(coffeeName: "Black coffee"),
    coffeeModel(coffeeName: "Winter special"),
    coffeeModel(coffeeName: "DECAFF"),
    coffeeModel(coffeeName: "CHOCOLATE"),
]
