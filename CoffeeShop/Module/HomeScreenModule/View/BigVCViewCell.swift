//
//  BigVCViewCell.swift
//  CoffeeShop
//
//  Created by Александр Богачев on 27.08.24.
//


import UIKit

class BigVCViewCell: UICollectionViewCell {
    
    let topView = UIView()
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
        contentView.addSubview(topView)
        topView.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.layer.cornerRadius = 10
         
        topView.backgroundColor = .green
        topView.layer.cornerRadius = 8
        topView.layer.masksToBounds = true
        
        NSLayoutConstraint.activate([
            topView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 256),
            topView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            topView.widthAnchor.constraint(equalToConstant: 70),
            topView.heightAnchor.constraint(equalToConstant: 93),
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
