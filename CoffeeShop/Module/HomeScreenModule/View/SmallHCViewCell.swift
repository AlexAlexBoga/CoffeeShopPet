//
//  SmallHCViewCell.swift
//  CoffeeShop
//
//  Created by Александр Богачев on 27.08.24.
//

import UIKit

class SmallHCViewCell: UICollectionViewCell {
    
    let bottomLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupCell() {
        contentView.backgroundColor = .clear
        setupBottomLabel()
    }
    
    func setupBottomLabel() {
        contentView.addSubview(bottomLabel)
        bottomLabel.translatesAutoresizingMaskIntoConstraints = false
        
        bottomLabel.font = .systemFont(ofSize: 12, weight: .regular)
        bottomLabel.text = "test label"
        bottomLabel.textColor = .white
        bottomLabel.textAlignment = .center
        bottomLabel.backgroundColor = .backgroundCollection
        bottomLabel.layer.cornerRadius = 10
        bottomLabel.layer.masksToBounds = true
    
        NSLayoutConstraint.activate([
            bottomLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            bottomLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            bottomLabel.widthAnchor.constraint(equalToConstant: 110),
            bottomLabel.heightAnchor.constraint(equalToConstant: 24),
                ])
      
    }
   
}

