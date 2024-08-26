//
//  TabBarController.swift
//  CoffeeShop
//
//  Created by Александр Богачев on 26.08.24.
//

import UIKit

class TabBarController: UITabBarController {
    
    init(tabBarControllers: [UIViewController]) {
        super.init(nibName: nil, bundle: nil)
        for tab in tabBarControllers {
            self.addChild(tab)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tabBar.backgroundColor = .blue
        tabBar.tintColor = .white
        tabBar.unselectedItemTintColor = .gray
        tabBar.itemPositioning = .centered
        tabBar.itemWidth = 40.0
        tabBar.itemSpacing = 30.0
        
        UITabBarItem.appearance().titlePositionAdjustment = UIOffset(horizontal: 0, vertical: -3)
    }
}


