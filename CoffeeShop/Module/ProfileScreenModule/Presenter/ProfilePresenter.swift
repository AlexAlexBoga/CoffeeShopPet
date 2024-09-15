//
//  ProfilePresenter.swift
//  CoffeeShop
//
//  Created by Александр Богачев on 1.09.24.
//

import UIKit

protocol ProfilePresenterProtocol: AnyObject {
//    func goToHomeVC()
}

class ProfilePresenter: ProfilePresenterProtocol {
  
   
    weak var coordinator: ProfileCoordinator!
   
    init(coordinator: ProfileCoordinator!) {
        self.coordinator = coordinator
    }
//
//     func goToHomeVC() {
//         coordinator.finish()
//     }
     
}
    
