//
//  HalfScreenPresentationController.swift
//  CoffeeShop
//
//  Created by Александр Богачев on 27.08.24.
//

import UIKit

class HalfScreenPresentationController: UIPresentationController {
    
    override var frameOfPresentedViewInContainerView: CGRect {
        guard let containerView = containerView else { return .zero }
        
        let height: CGFloat = containerView.bounds.height / 1
        let yOffset = containerView.bounds.height - height
        return CGRect(x: 0, y: yOffset, width: containerView.bounds.width, height: height)
    }
}
