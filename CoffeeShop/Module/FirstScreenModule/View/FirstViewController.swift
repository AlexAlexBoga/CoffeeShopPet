//
//  FirstViewController.swift
//  CoffeeShop
//
//  Created by Александр Богачев on 23.08.24.
//

import UIKit

class FirstViewController: UIViewController {
    
    private let backGroundImage = CSBackGroundView()
    private let coffeeLabel = UILabel()
    private let ehjoyLabel = UILabel()
    private let shopButton = CSButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
    }
    
    private func setupLayout() {
        setupBackGroundImage()
        stupCoffeeLabel()
        setupEnjoyLabel()
        setupButton()
    }

    private func setupBackGroundImage() {
        view.addSubview(backGroundImage)
        backGroundImage.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            backGroundImage.topAnchor.constraint(equalTo: view.topAnchor),
            backGroundImage.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            backGroundImage.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backGroundImage.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
    }
    
    private func stupCoffeeLabel() {
        view.addSubview(coffeeLabel)
        coffeeLabel.translatesAutoresizingMaskIntoConstraints = false
        coffeeLabel.text = "COFFEE SHOP"
        coffeeLabel.textColor = .black
        coffeeLabel.font = UIFont.systemFont(ofSize: 36, weight: .bold)
        coffeeLabel.textAlignment = .center
        
        NSLayoutConstraint.activate([
            coffeeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            coffeeLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
    }
    
    private func setupEnjoyLabel() {
        view.addSubview(ehjoyLabel)
        ehjoyLabel.translatesAutoresizingMaskIntoConstraints = false
        ehjoyLabel.text = "Enjoy the drink coffee."
        ehjoyLabel.textColor = .black
        ehjoyLabel.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        ehjoyLabel.textAlignment = .center
        
        NSLayoutConstraint.activate([
            ehjoyLabel.topAnchor.constraint(equalTo: coffeeLabel.bottomAnchor, constant: 37),
            ehjoyLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
    }
    
    private func setupButton() {
        view.addSubview(shopButton)
        shopButton.translatesAutoresizingMaskIntoConstraints = false
        shopButton.scheme = .black
        shopButton.setTitle("SHOP NOW")
        shopButton.action = { [weak self] in
            self?.buttonPressed()
        }
                
        NSLayoutConstraint.activate([
            shopButton.topAnchor.constraint(equalTo: ehjoyLabel.bottomAnchor, constant: 121),
            shopButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            shopButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            shopButton.heightAnchor.constraint(equalToConstant: 50),
        ])
    }

    func buttonPressed() {
        print("shopButtonPressed")
    }
}
