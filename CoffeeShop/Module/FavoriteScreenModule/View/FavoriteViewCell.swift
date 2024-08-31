//
//  FavoriteViewCell.swift
//  CoffeeShop
//
//  Created by Александр Богачев on 31.08.24.
//

import UIKit

class FavoriteViewCell: UICollectionViewCell {
  
    let imageView = UIImageView()
    let titleLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupCell() {
        contentView.backgroundColor = .itemBackground
        setupTopView()
        setupBottomLabel()
    }
    
    func setupTopView() {
        contentView.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.layer.cornerRadius = 10
        
        imageView.backgroundColor = .green
        imageView.layer.cornerRadius = 8
        imageView.layer.masksToBounds = true
        
        NSLayoutConstraint.activate([
            imageView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 256),
            imageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            imageView.widthAnchor.constraint(equalToConstant: 70),
            imageView.heightAnchor.constraint(equalToConstant: 93),
        ])
    
    }
    func setupBottomLabel() {
        contentView.addSubview(titleLabel)
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        titleLabel.font = .systemFont(ofSize: 16, weight: .medium)
        titleLabel.text = "Title label"
        titleLabel.textColor = .black
    
        NSLayoutConstraint.activate([
            titleLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            titleLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 15),
        ])
    }
}
