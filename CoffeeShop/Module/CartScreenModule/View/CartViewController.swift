//
//  CartViewController.swift
//  CoffeeShop
//
//  Created by Александр Богачев on 26.08.24.
//

import UIKit

class CartViewController: UIViewController {
    
    var cartPresenter: CartPresenter?
    private var cartItem: [CartModel] = []
        
    private let cartLabel = CSLabel()
    private let cartImage = UIImageView()
    private let makeOrderButton = CSCartButton()
    private let clearButton = CSCartButton()
    private let bottomView = UIView()
    private let locationImage = UIImageView()
    private let deliverLabel = CSLabel()
    private var addressLabel = CSLabel()
    private let lineView = UIView()
    private let sabtotalLabel = CSLabel()
    private var sabtotalPriceLabel = CSLabel()
    private let feeLabel = CSLabel()
    private var feePriceLabel = CSLabel()
    private var totalLabel = CSLabel()
    private var totalPriceLabel = CSLabel()
    
    
    lazy var orderCollection: UICollectionView = {
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumInteritemSpacing = 20
        layout.minimumLineSpacing = 27
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        return collection
    }()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
      
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .backgroud
        loadData()
        setupLayout()
    }

    private func loadData() {
        cartPresenter = CartPresenter(view: self)
        cartItem = cartPresenter?.getCartItems() ?? []
        orderCollection.reloadData()
    }
    
    private func setupLayout() {
        setupCartLabel()
        setupCartImage()
        setupRecentlyButton()
        setupPastOrderButton()
        setupOrderCollection()
        setupBottomView()
        setupLocationImage()
        setupDeliverLabel()
        setupAddressLabel()
        setupLineView()
        setupSabtotalLabel()
        setupSabtotalPriceLabel()
        setupFeeLabel()
        setupFeePriceLabel()
        setupTotalLabel()
        setupTotalPriceLabel()
    }
    
    private func setupCartLabel() {
        view.addSubview(cartLabel)
        cartLabel.translatesAutoresizingMaskIntoConstraints = false
        cartLabel.text = "Cart"
        
        NSLayoutConstraint.activate([
            cartLabel.topAnchor.constraint(equalTo: view.topAnchor,constant: 54),
            cartLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            cartLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -193),
        ])
    }
    
    private func setupCartImage() {
        view.addSubview(cartImage)
        cartImage.translatesAutoresizingMaskIntoConstraints = false
        cartImage.image = .cart
        
        NSLayoutConstraint.activate([
            cartImage.topAnchor.constraint(equalTo: cartLabel.bottomAnchor, constant: 13),
            cartImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            cartImage.heightAnchor.constraint(equalToConstant: 24),
            cartImage.widthAnchor.constraint(equalToConstant: 24),
        ])
    }
    
    private func setupRecentlyButton() {
        view.addSubview(makeOrderButton)
        makeOrderButton.translatesAutoresizingMaskIntoConstraints = false
        makeOrderButton.scheme = .black
        makeOrderButton.setTitle("Order")
        makeOrderButton.action = { [weak self] in
            self?.orderButtonPressed()
        }
                
        NSLayoutConstraint.activate([
            makeOrderButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 90),
            makeOrderButton.leadingAnchor.constraint(equalTo: cartImage.trailingAnchor, constant: 140),
            makeOrderButton.heightAnchor.constraint(equalToConstant: 25),
            makeOrderButton.widthAnchor.constraint(equalToConstant: 80)
        ])
    }
    
    private func setupPastOrderButton() {
        view.addSubview(clearButton)
        clearButton.translatesAutoresizingMaskIntoConstraints = false
        clearButton.scheme = .white
        clearButton.setTitle("Clear")
        clearButton.action = { [weak self] in
            self?.clearButtonPressed()
        }
                
        NSLayoutConstraint.activate([
            clearButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 90),
            clearButton.leadingAnchor.constraint(equalTo: makeOrderButton.trailingAnchor, constant: 20),
            clearButton.heightAnchor.constraint(equalToConstant: 25),
            clearButton.widthAnchor.constraint(equalToConstant: 80)
        ])
    }
    
    func setupOrderCollection() {
        view.addSubview(orderCollection)
        orderCollection.translatesAutoresizingMaskIntoConstraints = false
        
        orderCollection.backgroundColor = .backgroundCollection
        orderCollection.delegate = self
        orderCollection.dataSource = self
        orderCollection.register(CartViewCell.self, forCellWithReuseIdentifier: "CartViewCell")
        
        NSLayoutConstraint.activate([
            orderCollection.topAnchor.constraint(equalTo: cartImage.bottomAnchor, constant: 24),
            orderCollection.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            orderCollection.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            orderCollection.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -280),
        ])
    }
    
    private func setupBottomView() {
        view.addSubview(bottomView)
        bottomView.translatesAutoresizingMaskIntoConstraints = false
        bottomView.backgroundColor = .itemBackground
        bottomView.layer.cornerRadius = 9
        
        NSLayoutConstraint.activate([
            bottomView.topAnchor.constraint(equalTo: orderCollection.bottomAnchor,constant: 10),
            bottomView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            bottomView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            bottomView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10)
            
        ])
    }
    
    private func setupLocationImage() {
        bottomView.addSubview(locationImage)
        locationImage.translatesAutoresizingMaskIntoConstraints = false
        locationImage.image = .location
        
        NSLayoutConstraint.activate([
            locationImage.topAnchor.constraint(equalTo: bottomView.topAnchor, constant: 13),
            locationImage.leadingAnchor.constraint(equalTo: bottomView.leadingAnchor, constant: 30),
            locationImage.heightAnchor.constraint(equalToConstant: 20),
            locationImage.widthAnchor.constraint(equalToConstant: 20),
        ])
    }
    
    private func setupDeliverLabel() {
        bottomView.addSubview(deliverLabel)
        deliverLabel.translatesAutoresizingMaskIntoConstraints = false
        deliverLabel.text = "Deliver to:"
        deliverLabel.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        
        NSLayoutConstraint.activate([
            deliverLabel.topAnchor.constraint(equalTo: bottomView.topAnchor ,constant: 13),
            deliverLabel.leadingAnchor.constraint(equalTo: locationImage.trailingAnchor, constant: 11),
            deliverLabel.trailingAnchor.constraint(equalTo: bottomView.trailingAnchor, constant: -190),
        ])
    }
    
    private func setupAddressLabel() {
        bottomView.addSubview(addressLabel)
        addressLabel.translatesAutoresizingMaskIntoConstraints = false
        addressLabel.text = "No saved address" // заменить на текст из регистации
        addressLabel.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        
        NSLayoutConstraint.activate([
            addressLabel.topAnchor.constraint(equalTo: deliverLabel.bottomAnchor ,constant: 9),
            addressLabel.leadingAnchor.constraint(equalTo: bottomView.leadingAnchor, constant: 30),
            addressLabel.trailingAnchor.constraint(equalTo: bottomView.trailingAnchor, constant: -180),
        ])
    }
    
    private func setupLineView() {
        bottomView.addSubview(lineView)
        lineView.translatesAutoresizingMaskIntoConstraints = false
        lineView.backgroundColor = .gray
        
        NSLayoutConstraint.activate([
            lineView.topAnchor.constraint(equalTo: addressLabel.bottomAnchor ,constant: 9),
            lineView.leadingAnchor.constraint(equalTo: bottomView.leadingAnchor, constant: 30),
            lineView.trailingAnchor.constraint(equalTo: bottomView.trailingAnchor, constant: -30),
            lineView.heightAnchor.constraint(equalToConstant: 1),
        ])
    }
    
    private func setupSabtotalLabel() {
        bottomView.addSubview(sabtotalLabel)
        sabtotalLabel.translatesAutoresizingMaskIntoConstraints = false
        sabtotalLabel.text = "Sabtotal"
        sabtotalLabel.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        
        NSLayoutConstraint.activate([
            sabtotalLabel.topAnchor.constraint(equalTo: lineView.bottomAnchor ,constant: 15),
            sabtotalLabel.leadingAnchor.constraint(equalTo: bottomView.leadingAnchor, constant: 30),
            sabtotalLabel.trailingAnchor.constraint(equalTo: bottomView.trailingAnchor, constant: -180),
        ])
    }
    
    private func setupSabtotalPriceLabel() {
        bottomView.addSubview(sabtotalPriceLabel)
        sabtotalPriceLabel.translatesAutoresizingMaskIntoConstraints = false
        sabtotalPriceLabel.text = "€ 4,95" // заменить на текст из ячейки
        sabtotalPriceLabel.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        
        NSLayoutConstraint.activate([
        sabtotalPriceLabel.centerYAnchor.constraint(equalTo: sabtotalLabel.centerYAnchor),
        sabtotalPriceLabel.trailingAnchor.constraint(equalTo: bottomView.trailingAnchor, constant: -29),
        sabtotalPriceLabel.leadingAnchor.constraint(greaterThanOrEqualTo: sabtotalLabel.trailingAnchor, constant: 8)
        ])
    }
    
    private func setupFeeLabel() {
        bottomView.addSubview(feeLabel)
        feeLabel.translatesAutoresizingMaskIntoConstraints = false
        feeLabel.text = "Delivery fee"
        feeLabel.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        
        NSLayoutConstraint.activate([
            feeLabel.topAnchor.constraint(equalTo: sabtotalLabel.bottomAnchor ,constant: 9),
            feeLabel.leadingAnchor.constraint(equalTo: bottomView.leadingAnchor, constant: 30),
            feeLabel.trailingAnchor.constraint(equalTo: bottomView.trailingAnchor, constant: -180),
        ])
    }
    
    private func setupFeePriceLabel() {
        bottomView.addSubview(feePriceLabel)
        feePriceLabel.translatesAutoresizingMaskIntoConstraints = false
        feePriceLabel.text = "€ 1,50" // заменить на текст из ячейки
        feePriceLabel.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        
        NSLayoutConstraint.activate([
            feePriceLabel.centerYAnchor.constraint(equalTo: feeLabel.centerYAnchor),
            feePriceLabel.trailingAnchor.constraint(equalTo: bottomView.trailingAnchor, constant: -29),
            feePriceLabel.leadingAnchor.constraint(greaterThanOrEqualTo: sabtotalLabel.trailingAnchor, constant: 8)
        ])
    }
    
    private func setupTotalLabel() {
        bottomView.addSubview(totalLabel)
        totalLabel.translatesAutoresizingMaskIntoConstraints = false
        totalLabel.text = "TOTAL"
        totalLabel.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        
        NSLayoutConstraint.activate([
            totalLabel.topAnchor.constraint(equalTo: feeLabel.bottomAnchor ,constant: 12),
            totalLabel.leadingAnchor.constraint(equalTo: bottomView.leadingAnchor, constant: 30),
            totalLabel.trailingAnchor.constraint(equalTo: bottomView.trailingAnchor, constant: -180),
        ])
    }
    
    private func setupTotalPriceLabel() {
        bottomView.addSubview(totalPriceLabel)
        totalPriceLabel.translatesAutoresizingMaskIntoConstraints = false
        totalPriceLabel.text = "€ 7,50" // заменить на текст из ячейки
        totalPriceLabel.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        
        NSLayoutConstraint.activate([
            totalPriceLabel.centerYAnchor.constraint(equalTo: totalLabel.centerYAnchor),
            totalPriceLabel.trailingAnchor.constraint(equalTo: bottomView.trailingAnchor, constant: -29),
            totalPriceLabel.leadingAnchor.constraint(greaterThanOrEqualTo: sabtotalLabel.trailingAnchor, constant: 8)
        ])
    }
    
    func orderButtonPressed() {
       print("recentlyButtonPressed")
    }
    
    func clearButtonPressed() {
       print("pastOrderButtonPressed")
    }
    
}

extension CartViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cartItem.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CartViewCell", for: indexPath) as! CartViewCell
        guard indexPath.item < cartItem.count else {
            return cell
        }
        let cartModel = cartItem[indexPath.item]
        cell.configure(with: cartModel.imageName,
                       title: cartModel.description)
        return cell
    }
    
}

extension CartViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        return UIEdgeInsets(top: 40, left: 0, bottom: 0, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: 332, height: 105)
    }
}


