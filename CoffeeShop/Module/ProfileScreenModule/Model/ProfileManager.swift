//
//  ProfileManager.swift
//  CoffeeShop
//
//  Created by Александр Богачев on 19.09.24.
//

import Foundation

struct Profile {
    var name: String
    var address: String
    var phone: String
    var email: String
}

class ProfileManager {
    
    static let shared = ProfileManager()
    private let defaults = UserDefaults.standard
    
    private enum Keys {
        static let name = "profileName"
        static let address = "profileAddress"
        static let phone = "profilePhone"
        static let email = "profileEmail"
    }
    
    func save(_ profile: Profile) {
        defaults.set(profile.name, forKey: Keys.name)
        defaults.set(profile.address, forKey: Keys.address)
        defaults.set(profile.phone, forKey: Keys.phone)
        defaults.set(profile.email, forKey: Keys.email)
    }
    
    func loadProfile() -> Profile {
        let name = defaults.string(forKey: Keys.name) ?? ""
        let address = defaults.string(forKey: Keys.address) ?? ""
        let phone = defaults.string(forKey: Keys.phone) ?? ""
        let email = defaults.string(forKey: Keys.email) ?? ""
        return Profile(name: name, address: address, phone: phone, email: email)
    }
    
    func clear() {
        defaults.removeObject(forKey: Keys.name)
        defaults.removeObject(forKey: Keys.address)
        defaults.removeObject(forKey: Keys.phone)
        defaults.removeObject(forKey: Keys.email)
    }
}
