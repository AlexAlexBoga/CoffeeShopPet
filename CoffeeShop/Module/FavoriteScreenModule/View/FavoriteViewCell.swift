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
    let priceLabel = UILabel()
    let coffeTypeLabel = UILabel()
    
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
        setupCoffeeTypeLabel()
        setupBottomLabel()
        setupPriceLabel()
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
    
    func setupCoffeeTypeLabel() {
        contentView.addSubview(coffeTypeLabel)
        coffeTypeLabel.translatesAutoresizingMaskIntoConstraints = false
        
        coffeTypeLabel.font = .systemFont(ofSize: 10, weight: .medium)
        coffeTypeLabel.text = "CoffeSortLabel"
        coffeTypeLabel.textColor = .black
        
        NSLayoutConstraint.activate([
            coffeTypeLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            coffeTypeLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 15),
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
    
    
    func setupPriceLabel() {
        contentView.addSubview(priceLabel)
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        
        priceLabel.font = .systemFont(ofSize: 16, weight: .medium)
        priceLabel.text = "€"
        priceLabel.textColor = .black
        
        NSLayoutConstraint.activate([
            priceLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            priceLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            priceLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15),
        ])
    }
    
    func configure(with imageName: String, title: String, price: Double, coffeeType: String) {
        imageView.image = UIImage(named: imageName)
        coffeTypeLabel.text = coffeeType
        titleLabel.text = title
        priceLabel.text = "€ \(price)"
    }
}
