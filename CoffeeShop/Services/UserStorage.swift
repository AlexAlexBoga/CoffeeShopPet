//
//  UserStorage.swift
//  CoffeeShop
//
//  Created by Александр Богачев on 31.08.24.
//

import Foundation

// Для сохранения состояния входа в приложение
class UserStorage {
    
    static let shared = UserStorage()
    
    var passedOnboarding: Bool {
        get { UserDefaults.standard.bool(forKey: "passedOnboarding")}
        set { UserDefaults.standard.set(newValue, forKey: "passedOnboarding")}
    }
}
