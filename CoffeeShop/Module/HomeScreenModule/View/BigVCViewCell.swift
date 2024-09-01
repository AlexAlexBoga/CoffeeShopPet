//
//  BigVCViewCell.swift
//  CoffeeShop
//
//  Created by Александр Богачев on 27.08.24.
//


import UIKit

class BigVCViewCell: UICollectionViewCell {
    
    let imageView = UIImageView()
    let titleLabel = UILabel()
    let priceLabel = UILabel()
    
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
            priceLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 15),
            priceLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: -15),
        ])
    }
    func configure(with imageName: String, title: String, price: Double) {
            imageView.image = UIImage(named: imageName)
            titleLabel.text = title
            priceLabel.text = "€ \(price)"
        }
    
}
