//
//  HomeViewController.swift
//  CoffeeShop
//
//  Created by Александр Богачев on 26.08.24.
//

import UIKit

class HomeViewController: UIViewController {

    private let label = CSLabel()
    
    lazy var smallHCollection: UICollectionView = {
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 8
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)

        return collection
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .gray
        setupLabel()
        setupSmallHCollection()
        
    }
 
    func setupLabel() {
        view.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.text = "What would you like to drink today?"
        
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: view.topAnchor, constant: 83),
            label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            label.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -193),
        ])
    }
    
    func setupSmallHCollection() {
        view.addSubview(smallHCollection)
        smallHCollection.translatesAutoresizingMaskIntoConstraints = false
        
        smallHCollection.backgroundColor = .red
        smallHCollection.delegate = self
        smallHCollection.dataSource = self
        smallHCollection.register(SmallHCViewCell.self, forCellWithReuseIdentifier: "SmallHCViewCell")
        
        NSLayoutConstraint.activate([
           smallHCollection.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 40),
           smallHCollection.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
           smallHCollection.trailingAnchor.constraint(equalTo: view.trailingAnchor),
           smallHCollection.heightAnchor.constraint(equalToConstant: 24),
        ])
    }
    
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
      10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SmallHCViewCell", for: indexPath)
        
        return cell
    }
    
}

extension HomeViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
      
        return CGSize(width: 110, height: 24)
    }
}
