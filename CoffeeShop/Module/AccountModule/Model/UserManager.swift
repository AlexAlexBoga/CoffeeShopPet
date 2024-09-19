//
//  UserManager.swift
//  CoffeeShop
//
//  Created by Александр Богачев on 15.09.24.
//

import Foundation


class UserManager {
    
    private let userDefaults = UserDefaults.standard
    private let emailKey = "userEmail"
    private let passwordKey = "userPassword"
    
    func saveUser(email: String, password: String) {
        userDefaults.set(email, forKey: emailKey)
        userDefaults.set(password, forKey: passwordKey)
        print("User saved \(email)")
    }
    
    func isUserRegistered(email: String) -> Bool {
        if let savedEmail = userDefaults.string(forKey: emailKey) {
            return savedEmail == email
        } else {
            return false
        }
    }
    
    func getPassword(for email: String) -> String? {
        if let savedEmail = userDefaults.string(forKey: emailKey), savedEmail == email {
            return userDefaults.string(forKey: passwordKey)
        } else {
            return nil
        }
    }
    
    func deleteUser() {
        userDefaults.removeObject(forKey: emailKey)
        userDefaults.removeObject(forKey: passwordKey)
        print("User data has been deleted.")
    }
    
    func validateUser (email: String, password: String) -> Bool {
        if let savedEmail = userDefaults.string(forKey: emailKey),
           let savedPassword = userDefaults.string(forKey: passwordKey) {
            return savedEmail == email && savedPassword == password
        }
        return false
    }
}
