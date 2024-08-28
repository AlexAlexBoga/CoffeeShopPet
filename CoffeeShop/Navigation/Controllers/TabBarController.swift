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
        
        tabBar.backgroundColor = .backgroud
        tabBar.tintColor = .black
        tabBar.unselectedItemTintColor = .gray
        tabBar.itemPositioning = .centered
        tabBar.itemWidth = 40.0
        tabBar.itemSpacing = 60.0
        
        
        for item in tabBar.items ?? [] {
                    item.imageInsets = UIEdgeInsets(top: -6, left: 0, bottom: 0, right: 0)
                    item.title = nil // Убираем текст
                }
            UITabBarItem.appearance().titlePositionAdjustment = UIOffset(horizontal: 0, vertical: -3)
        }
    }


