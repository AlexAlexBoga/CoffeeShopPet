//
//  CSLabel.swift
//  CoffeeShop
//
//  Created by Александр Богачев on 27.08.24.
//

import UIKit

class CSLabel: UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLabel(with: text ?? "")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func setupLabel(with text: String) {
    
        self.numberOfLines = 0
        self.lineBreakMode = .byWordWrapping
        self.text = text
        self.textColor = .black
        self.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        self.textAlignment = .left
    }
    
}
