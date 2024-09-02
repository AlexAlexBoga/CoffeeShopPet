//
//  OrderViewPresenter.swift
//  CoffeeShop
//
//  Created by Александр Богачев on 27.08.24.
//

import UIKit

protocol OrderPresenterProtocol: AnyObject {
    
}

class OrderViewPresenter: OrderPresenterProtocol {
   
    weak var coordinator: OrderCoordinator!
   
    init(coordinator: OrderCoordinator!) {
        self.coordinator = coordinator
    }
    
    func orderViewFinish() {
        coordinator.finish()
    }

    }
    

