//
//  CSBackGroundView.swift
//  CoffeeShop
//
//  Created by Александр Богачев on 26.08.24.
//

import UIKit

class CSBackGroundView: UIView {
    
    private let backGroundImage = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupBackGroundImage()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupBackGroundImage() {
        self.addSubview(backGroundImage)
        backGroundImage.image = UIImage(named: "backgroundImage")
        backGroundImage.translatesAutoresizingMaskIntoConstraints = false
        backGroundImage.contentMode = .scaleAspectFit
        backGroundImage.clipsToBounds = true
        
        NSLayoutConstraint.activate([
            backGroundImage.topAnchor.constraint(equalTo: self.topAnchor),
            backGroundImage.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            backGroundImage.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            backGroundImage.trailingAnchor.constraint(equalTo: self.trailingAnchor),
        ])
        self.sendSubviewToBack(backGroundImage)
    }
}
