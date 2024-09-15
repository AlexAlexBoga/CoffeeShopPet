//
//  FavoriteViewController.swift
//  CoffeeShop
//
//  Created by Александр Богачев on 26.08.24.
//

import UIKit

class FavoriteViewController: UIViewController {
    
    var favoritePresenter: FavoritePresenterProtocol?
    private var favoriteItem: [FavoriteModel] = []
    
    private let favoriteLabel = CSLabel()
    private let drinksLabel = CSLabel()
   
    
    lazy var favoriteCollection: UICollectionView = {
        
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
        loadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .backgroud
        
        setupLayout()
        loadData()
    }
    
    func loadData() {
        favoritePresenter?.loadFavoriteItemsFromFile()
        favoriteItem = favoritePresenter?.getFavoriteItem() ?? []
        print("Favorite items count: \(favoriteItem.count)")
        favoriteCollection.reloadData()
    }
    
    private func setupLayout() {
        setupFavoriteLabel()
        setupDrinksLabel()
        setupFavoriteCollection()
    }
    
    private func setupFavoriteLabel() {
        view.addSubview(favoriteLabel)
        favoriteLabel.translatesAutoresizingMaskIntoConstraints = false
        favoriteLabel.text = "Favorites"
        
        NSLayoutConstraint.activate([
            favoriteLabel.topAnchor.constraint(equalTo: view.topAnchor,constant: 54),
            favoriteLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            favoriteLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -193),
        ])
    }
    
    private func setupDrinksLabel() {
        view.addSubview(drinksLabel)
        drinksLabel.translatesAutoresizingMaskIntoConstraints = false
        drinksLabel.text = "Your favorite drinks to lighten up your day"
        drinksLabel.font = .systemFont(ofSize: 16, weight: .regular)
        
        NSLayoutConstraint.activate([
            drinksLabel.topAnchor.constraint(equalTo: favoriteLabel.bottomAnchor,constant: 14),
            drinksLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            drinksLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
        ])
    }
    
    func setupFavoriteCollection() {
        view.addSubview(favoriteCollection)
        favoriteCollection.translatesAutoresizingMaskIntoConstraints = false
        
        favoriteCollection.backgroundColor = .backgroundCollection
        favoriteCollection.delegate = self
        favoriteCollection.dataSource = self
        favoriteCollection.register(FavoriteViewCell.self, forCellWithReuseIdentifier: "FavoriteViewCell")
        
        NSLayoutConstraint.activate([
            favoriteCollection.topAnchor.constraint(equalTo: drinksLabel.bottomAnchor, constant: 28),
            favoriteCollection.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            favoriteCollection.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            favoriteCollection.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }

}

extension FavoriteViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return favoritePresenter?.getFavoriteItem().count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FavoriteViewCell", for: indexPath) as! FavoriteViewCell
        guard indexPath.item < favoriteItem.count else {
            return cell
        }
        let favoriteModel = favoriteItem[indexPath.item]
        cell.configure(with: favoriteModel.imageName,
                       title: favoriteModel.description,
                       price: favoriteModel.price,
                       coffeeType: favoriteModel.coffeeType)
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, contextMenuConfigurationForItemAt indexPath: IndexPath, point: CGPoint) -> UIContextMenuConfiguration? {

            let deleteAction = UIAction(title: "Delete", attributes: .destructive) { [weak self] action in
                guard let self = self else { return }

                self.favoriteItem.remove(at: indexPath.item)
                self.favoritePresenter?.updateCartItems(self.favoriteItem)
                self.favoriteCollection.reloadData()
            }
        
            return UIContextMenuConfiguration(identifier: nil, previewProvider: nil) { _ in
                UIMenu(title: "", children: [deleteAction])
            }
        }
}

extension FavoriteViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        return UIEdgeInsets(top: 40, left: 0, bottom: 0, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: 332, height: 105)
    }
}


