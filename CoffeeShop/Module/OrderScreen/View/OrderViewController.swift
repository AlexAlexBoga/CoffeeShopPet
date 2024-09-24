//
//  OrderViewController.swift
//  CoffeeShop
//
//  Created by Александр Богачев on 27.08.24.
//

import UIKit

class OrderViewController: UIViewController {
    
    var presenter: OrderPresenterProtocol?
    
    private var imageView: UIImageView!
    private var imageToSet: UIImage?
    private var coffeeName: String?
    private var imageToSetName: String?
    private var coffeeType: String?
    private var coffeePrice: Double?
    
    private let bottomView = UIView()
    private var mainLabel = CSLabel()
    private let addFavoriteImage = UIImageView()
    private let shareImage = UIImageView()
    private var coffeeNameLabel = CSLabel()
    private let orderLabel = CSLabel()
    private let starImage = UIImageView()
    private let ratingImage = UIImageView()
    private let sizeLabel = UILabel()
    private let firstPriceButton = CSOrderButton()
    private let secondPriceButton = CSOrderButton()
    private let thirdPriceButton = CSOrderButton()
    private var priceLabel = UILabel()
    private let countButton = CSCounterView()
    private let addButton = CSButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .backgroud
        setupLayout()
    }
    
    private func setupLayout() {
        setupImageView()
        setupbottomViewView()
        setupMainLabel()
        setupAddFavoriteImage()
        setupshareImage()
        setupCoffeeNameLabel()
        setupOrderLabel()
        setupStarImage()
        setupRatingImage()
        setupSizeLabel()
        setupFirstPriceButton()
        setupSecondPriceButton()
        setupThirdPriceButton()
        setupPriceLabel()
        stupcountButton() 
        setupAddButton()
    }
    
    private func setupImageView() {
        imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        view.addSubview(imageView)
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 83),
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            imageView.heightAnchor.constraint(equalToConstant: 260)
        ])
        
        if let image = presenter?.getSelectedImage() {
            setImage(image: image)
        }
  
    }

    private func setupbottomViewView() {
        bottomView.backgroundColor = .orderBack
        bottomView.layer.cornerRadius = 25
        view.addSubview(bottomView)
        bottomView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            bottomView.topAnchor.constraint(equalTo: view.topAnchor,constant: 323),
            bottomView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            bottomView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            bottomView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
            
        ])
    }
    
    private func setupMainLabel() {
        bottomView.addSubview(mainLabel)
        mainLabel.translatesAutoresizingMaskIntoConstraints = false
        mainLabel.text = coffeeType ?? "Winter special"  // заменить на текст из ячейки
        mainLabel.textColor = .orderText
        mainLabel.font = .systemFont(ofSize: 36, weight: .bold)
        
        NSLayoutConstraint.activate([
            mainLabel.topAnchor.constraint(equalTo: bottomView.topAnchor, constant: 42),
            mainLabel.leadingAnchor.constraint(equalTo: bottomView.leadingAnchor, constant: 30),
            mainLabel.trailingAnchor.constraint(equalTo: bottomView.trailingAnchor, constant: -214),
        ])
    }
    
    private func setupCoffeeNameLabel() {
        bottomView.addSubview(coffeeNameLabel)
        coffeeNameLabel.translatesAutoresizingMaskIntoConstraints = false
        coffeeNameLabel.text = coffeeName ?? "CAPPUCINO LATTE"  // заменить на текст из ячейки
        coffeeNameLabel.textColor = .orderText
        coffeeNameLabel.font = .systemFont(ofSize: 16, weight: .bold)
        
        NSLayoutConstraint.activate([
            coffeeNameLabel.topAnchor.constraint(equalTo: addFavoriteImage.bottomAnchor, constant: 60),
            coffeeNameLabel.leadingAnchor.constraint(equalTo: bottomView.leadingAnchor, constant: 30),
            coffeeNameLabel.trailingAnchor.constraint(equalTo: bottomView.trailingAnchor, constant: -210),
        ])
        
        if let name = presenter?.getSelectedCoffeeName() {
            setCoffeeName(name: name)
        }
    }
    
    private func setupOrderLabel() {
        bottomView.addSubview(orderLabel)
        orderLabel.translatesAutoresizingMaskIntoConstraints = false
        orderLabel.text = "Complex, yet smooth flavor made to order."
        orderLabel.textColor = .orderText
        orderLabel.font = .systemFont(ofSize: 14, weight: .regular)
        
        NSLayoutConstraint.activate([
            orderLabel.topAnchor.constraint(equalTo: coffeeNameLabel.bottomAnchor, constant: 10),
            orderLabel.leadingAnchor.constraint(equalTo: bottomView.leadingAnchor, constant: 30),
            orderLabel.trailingAnchor.constraint(equalTo: bottomView.trailingAnchor, constant: -40),
        ])
    }
    
    private func setupStarImage() {
        bottomView.addSubview(starImage)
        starImage.translatesAutoresizingMaskIntoConstraints = false
        starImage.image = .star
        
        NSLayoutConstraint.activate([
            starImage.topAnchor.constraint(equalTo: orderLabel.bottomAnchor, constant: 20),
            starImage.leadingAnchor.constraint(equalTo: bottomView.leadingAnchor, constant: 30),
            starImage.heightAnchor.constraint(equalToConstant: 19),
            starImage.widthAnchor.constraint(equalToConstant: 19),
        ])
    }
    
    private func setupRatingImage() {
        bottomView.addSubview(ratingImage)
        ratingImage.translatesAutoresizingMaskIntoConstraints = false
        ratingImage.image = .rating
        
        NSLayoutConstraint.activate([
            ratingImage.topAnchor.constraint(equalTo: orderLabel.bottomAnchor, constant: 21),
            ratingImage.leadingAnchor.constraint(equalTo: starImage.trailingAnchor, constant: 8),
            ratingImage.heightAnchor.constraint(equalToConstant: 16),
            ratingImage.widthAnchor.constraint(equalToConstant: 34),
        ])
    }
    
    private func setupAddFavoriteImage() {
        bottomView.addSubview(addFavoriteImage)
        addFavoriteImage.translatesAutoresizingMaskIntoConstraints = false
        addFavoriteImage.image = .favoriteHeart
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(favoriteImageTapped))
           addFavoriteImage.isUserInteractionEnabled = true
           addFavoriteImage.addGestureRecognizer(tapGesture)
        
        NSLayoutConstraint.activate([
            addFavoriteImage.topAnchor.constraint(equalTo: bottomView.topAnchor, constant: 66),
            addFavoriteImage.trailingAnchor.constraint(equalTo: bottomView.trailingAnchor, constant: -81),
            addFavoriteImage.heightAnchor.constraint(equalToConstant: 24),
            addFavoriteImage.widthAnchor.constraint(equalToConstant: 24),
        ])
    }
    
    private func setupshareImage() {
        bottomView.addSubview(shareImage)
        shareImage.translatesAutoresizingMaskIntoConstraints = false
        shareImage.image = .share
        
        NSLayoutConstraint.activate([
            shareImage.topAnchor.constraint(equalTo: bottomView.topAnchor, constant: 66),
            shareImage.trailingAnchor.constraint(equalTo: bottomView.trailingAnchor, constant: -30),
            shareImage.heightAnchor.constraint(equalToConstant: 24),
            shareImage.widthAnchor.constraint(equalToConstant: 24),
        ])
    }
    
    private func setupSizeLabel() {
        bottomView.addSubview(sizeLabel)
        sizeLabel.translatesAutoresizingMaskIntoConstraints = false
        sizeLabel.text = "Size"
        sizeLabel.textColor = .orderText
        sizeLabel.font = .systemFont(ofSize: 14, weight: .medium)
        
        NSLayoutConstraint.activate([
            sizeLabel.topAnchor.constraint(equalTo: ratingImage.bottomAnchor, constant: 20),
            sizeLabel.leadingAnchor.constraint(equalTo: bottomView.leadingAnchor, constant: 30),
            sizeLabel.trailingAnchor.constraint(equalTo: bottomView.trailingAnchor, constant: -280),
        ])
    }
    
    private func setupFirstPriceButton() {
        bottomView.addSubview(firstPriceButton)
        firstPriceButton.translatesAutoresizingMaskIntoConstraints = false
        firstPriceButton.scheme = .offButton
        firstPriceButton.setTitle("200 ml")
        firstPriceButton.action = { [weak self] in
            self?.buttonPress(for: .button1)
        }
                
        NSLayoutConstraint.activate([
            firstPriceButton.topAnchor.constraint(equalTo: sizeLabel.bottomAnchor, constant: 9),
            firstPriceButton.leadingAnchor.constraint(equalTo: bottomView.leadingAnchor, constant: 30),
            firstPriceButton.heightAnchor.constraint(equalToConstant: 44),
            firstPriceButton.widthAnchor.constraint(equalToConstant: 100)
        ])
    }
    
    private func setupSecondPriceButton() {
        bottomView.addSubview(secondPriceButton)
        secondPriceButton.translatesAutoresizingMaskIntoConstraints = false
        secondPriceButton.scheme = .offButton
        secondPriceButton.setTitle("300 ml")
        secondPriceButton.action = { [weak self] in
            self?.buttonPress(for: .button2)
        }
                
        NSLayoutConstraint.activate([
            secondPriceButton.centerYAnchor.constraint(equalTo: firstPriceButton.centerYAnchor),
            secondPriceButton.leadingAnchor.constraint(equalTo: firstPriceButton.trailingAnchor, constant: 12),
            secondPriceButton.heightAnchor.constraint(equalToConstant: 44),
            secondPriceButton.widthAnchor.constraint(equalToConstant: 100)
        ])
    }
    
    private func setupThirdPriceButton() {
        bottomView.addSubview(thirdPriceButton)
        thirdPriceButton.translatesAutoresizingMaskIntoConstraints = false
        thirdPriceButton.scheme = .offButton
        thirdPriceButton.setTitle("350 ml")
        thirdPriceButton.action = { [weak self] in
            self?.buttonPress(for: .button3)
        }
                
        NSLayoutConstraint.activate([
            thirdPriceButton.centerYAnchor.constraint(equalTo: secondPriceButton.centerYAnchor),
            thirdPriceButton.leadingAnchor.constraint(equalTo: secondPriceButton.trailingAnchor, constant: 12),
            thirdPriceButton.heightAnchor.constraint(equalToConstant: 44),
            thirdPriceButton.widthAnchor.constraint(equalToConstant: 100)
        ])
    }
    
    private func setupPriceLabel() {
        bottomView.addSubview(priceLabel)
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        priceLabel.text = coffeePrice != nil ? String(format: "€ %.2f", coffeePrice!) : "€ 4,95" // заменить на текст из ячейки
        priceLabel.textColor = .orderText
        priceLabel.font = .systemFont(ofSize: 32, weight: .bold)
        
        NSLayoutConstraint.activate([
            priceLabel.topAnchor.constraint(equalTo: firstPriceButton.bottomAnchor, constant: 40),
            priceLabel.leadingAnchor.constraint(equalTo: bottomView.leadingAnchor, constant: 30),
            priceLabel.trailingAnchor.constraint(equalTo: bottomView.trailingAnchor, constant: -260),
        ])
    }
    
    private func stupcountButton() {
        bottomView.addSubview(countButton)
        countButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            countButton.topAnchor.constraint(equalTo: priceLabel.bottomAnchor, constant: 10),
            countButton.leadingAnchor.constraint(equalTo: bottomView.leadingAnchor, constant: 30),
            countButton.centerXAnchor.constraint(equalTo: bottomView.centerXAnchor),
            countButton.widthAnchor.constraint(equalToConstant: 133),
            countButton.heightAnchor.constraint(equalToConstant: 47),
        ])
    }
    
    private func setupAddButton() {
        view.addSubview(addButton)
        addButton.translatesAutoresizingMaskIntoConstraints = false
        addButton.scheme = .test
        addButton.setTitle("ADD TO CART")
        addButton.action = { [weak self] in
            self?.addButtonPressed()
        }
                
        NSLayoutConstraint.activate([
            addButton.centerYAnchor.constraint(equalTo: countButton.centerYAnchor),
            addButton.leadingAnchor.constraint(equalTo: countButton.trailingAnchor, constant: 10),
            addButton.trailingAnchor.constraint(equalTo: bottomView.trailingAnchor, constant: -30),
            addButton.heightAnchor.constraint(equalToConstant: 47),
        ])
    }
    
    
    enum ButtonType {
        case button1
        case button2
        case button3
    }
    
    private func buttonPress(for buttonType: ButtonType) {
        switch buttonType {
        case .button1:
            firstPriceButton.scheme = .onButton
            secondPriceButton.scheme = .offButton
            thirdPriceButton.scheme = .offButton
            if let newPrice = presenter?.setSelectedFirstPrice(coffeePrice) {
                priceLabel.text = String(format: "€ %.2f", newPrice)
            }
            firstButtonPressed()
        case .button2:
            firstPriceButton.scheme = .offButton
            secondPriceButton.scheme = .onButton
            thirdPriceButton.scheme = .offButton
            if let newPrice = presenter?.setSelectedSecondPrice(coffeePrice) {
                priceLabel.text = String(format: "€ %.2f", newPrice)
            }
            secondButtonPressed()
        case .button3:
            firstPriceButton.scheme = .offButton
            secondPriceButton.scheme = .offButton
            thirdPriceButton.scheme = .onButton
            if let newPrice = presenter?.setSelectedThirdPrice(coffeePrice) {
                priceLabel.text = String(format: "€ %.2f", newPrice)
            }
            thirdButtonPressed()
        }
    }
    
    func setImage(image: UIImage) {
        imageToSet = image
        if imageView != nil {
            imageView.image = image
        }
    }
    
    func setCoffeeName(name: String) {
        coffeeName = name
        coffeeNameLabel.text = name
    }
    
    func setImageName(name: String) {
        imageToSetName = name
    }
    
    func setCoffeeType(name: String) {
        coffeeType = name
    }
    
    func setCoffeePrice(price: Double) {
        coffeePrice = price
    }
    
    @objc
    func favoriteImageTapped() {
        print("favoriteImageTapped")
        presenter?.addToFavoriteButtonPressed()
    }

    func firstButtonPressed() {
       print("firstPriceButton")
//        presenter?.setSelectedFirstPrice(coffeePrice)
    }
    func secondButtonPressed() {
//        presenter?.setSelectedSecondPrice(coffeePrice)
       print("secondPriceButton")
    }
    func thirdButtonPressed() {
//        presenter?.setSelectedThirdPrice(coffeePrice)
       print("thirdPriceButton")
    }
    func addButtonPressed() {
        print("addButtonPressed")
        presenter?.addToCartButtonPressed()
        
        dismiss(animated: true, completion: nil)
    }

}


