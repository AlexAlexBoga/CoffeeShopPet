//
//  HomeModel.swift
//  CoffeeShop
//
//  Created by Александр Богачев on 27.08.24.
//

//import Foundation
//
//
//struct ImageModel {
//    var imageName: String
//}
//
//let imageArray: [ImageModel] = [
//    ImageModel(imageName: "image1"),
//    ImageModel(imageName: "image2"),
//    ImageModel(imageName: "image3"),
//    ImageModel(imageName: "image4"),
//    ImageModel(imageName: "image1"),
//    ImageModel(imageName: "image2"),
//    ImageModel(imageName: "image3"),
//    ImageModel(imageName: "image4"),
//]
//
//struct coffeeModel {
//    var coffeeName: String
//}
//
//let coffeeArray: [coffeeModel] = [
//    coffeeModel(coffeeName: "Popular"),
//    coffeeModel(coffeeName: "Black coffee"),
//    coffeeModel(coffeeName: "Winter special"),
//    coffeeModel(coffeeName: "DECAFF"),
//    coffeeModel(coffeeName: "CHOCOLATE"),
//]


import Foundation


struct ImageModel {
    var imageName: String
    var description: String
    var price: Double
    
}

let imageArray: [ImageModel] = [
    ImageModel(imageName: "image1", description: "image1 description", price: 4.5),
    ImageModel(imageName: "image2", description: "image2 description", price: 4.0),
    ImageModel(imageName: "image3", description: "image3 description", price: 3.5),
    ImageModel(imageName: "image4", description: "image4 description", price: 4.9),
    ImageModel(imageName: "image1", description: "image1 description", price: 4.5),
    ImageModel(imageName: "image2", description: "image2 description", price: 4.0),
    ImageModel(imageName: "image3", description: "image3 description", price: 4.5),
    ImageModel(imageName: "image4", description: "image4 description", price: 4.9),
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
