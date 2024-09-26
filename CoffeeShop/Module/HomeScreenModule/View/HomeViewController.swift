//
//  HomeViewController.swift
//  CoffeeShop
//
//  Created by Александр Богачев on 26.08.24.
//

import UIKit

class HomeViewController: UIViewController {
    
    var presenter: HomePresenterProtocol?
    
    private let label = CSLabel()
    private var coffeeArray: [СoffeeModel] = []
    private var imageArray: [ImageModel] = []
    private var filteredImageArray: [ImageModel] = []
    
    lazy var smallHCollection: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 8
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.tag = 1
        
        return collection
    }()
    
    lazy var bigVCollection: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumInteritemSpacing = 20
        layout.minimumLineSpacing = 27
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.tag = 2
        
        return collection
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .backgroud
        setupLayout()
        loadData()
    }
    
    private func setupLayout() {
        setupLabel()
        setupSmallHCollection()
        setupBigVCollection()
    }
    
    private func loadData() {
        guard let presenter = presenter else { return }
        coffeeArray = presenter.getCoffeeData()
        imageArray = presenter.getImageData()
        
        filterImages(for: "All coffee")
        
        smallHCollection.reloadData()
        bigVCollection.reloadData()
    }
    
    private func filterImages(for coffeeType: String) {
        if coffeeType == "All coffee" {
            filteredImageArray = imageArray
        } else {
            filteredImageArray = imageArray.filter { $0.coffeeType == coffeeType }
        }
        bigVCollection.reloadData()
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
        
        smallHCollection.backgroundColor = .backgroud
        smallHCollection.showsHorizontalScrollIndicator = false
        smallHCollection.delegate = self
        smallHCollection.dataSource = self
        smallHCollection.register(SmallHCViewCell.self, forCellWithReuseIdentifier: "SmallHCViewCell")
        
        NSLayoutConstraint.activate([
            smallHCollection.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 28),
            smallHCollection.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            smallHCollection.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            smallHCollection.heightAnchor.constraint(equalToConstant: 24),
        ])
    }
    
    func setupBigVCollection() {
        view.addSubview(bigVCollection)
        bigVCollection.translatesAutoresizingMaskIntoConstraints = false
        
        bigVCollection.backgroundColor = .backgroundCollection
        bigVCollection.showsHorizontalScrollIndicator = false
        bigVCollection.delegate = self
        bigVCollection.dataSource = self
        bigVCollection.register(BigVCViewCell.self, forCellWithReuseIdentifier: "BigVCViewCell")
        
        NSLayoutConstraint.activate([
            bigVCollection.topAnchor.constraint(equalTo: smallHCollection.bottomAnchor, constant: 34),
            bigVCollection.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            bigVCollection.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            bigVCollection.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
    
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView.tag {
        case 1:
            return coffeeArray.count
        case 2:
            return filteredImageArray.count
        default:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        switch collectionView.tag {
        case 1:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SmallHCViewCell", for: indexPath) as! SmallHCViewCell
            guard indexPath.item < coffeeArray.count else {
                return cell
            }
            let coffeeName = coffeeArray[indexPath.item].coffeeName
            cell.bottomLabel.text = coffeeName
            return cell
        case 2:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BigVCViewCell", for: indexPath) as! BigVCViewCell
            guard indexPath.item < filteredImageArray.count else {
                
                return cell
            }
            let imageModel = filteredImageArray[indexPath.item]
            
            cell.configure(with: imageModel.imageName,
                           title: imageModel.description,
                           price: imageModel.price,
                           coffeeType: imageModel.coffeeType)
            return cell
        default:
            return UICollectionViewCell()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView.tag == 1 {
            let selectedCoffeeType = coffeeArray[indexPath.item].coffeeName
            filterImages(for: selectedCoffeeType)
            
        } else if collectionView.tag == 2 {
            let selectedImageModel = filteredImageArray[indexPath.item]
            let imageName = selectedImageModel.imageName
            let coffeeType = selectedImageModel.coffeeType
            let coffeePrice = selectedImageModel.price
            
            guard let selectedImage = UIImage(named: imageName) else {
                print("Image not found: \(imageName)")
                return
            }
            
            let orderVC = OrderViewController()
            let orderPresenter = OrderPresenter(view: nil,
                                                image: selectedImage,
                                                coffeeName: selectedImageModel.description,
                                                selectedImageName: imageName,
                                                coffeeType: selectedImageModel.coffeeType,
                                                coffeePrice: selectedImageModel.price)
            orderVC.setImage(image: selectedImage)
            orderVC.setCoffeeName(name: selectedImageModel.description)
            orderVC.setImageName(name: imageName)
            orderVC.setCoffeeType(name: coffeeType)
            orderVC.setCoffeePrice(price: coffeePrice)
            orderVC.presenter = orderPresenter
            orderVC.modalPresentationStyle = .pageSheet
            
            present(orderVC, animated: true, completion: nil)
        }
    }
}
extension HomeViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        switch collectionView.tag {
        case 1:
            return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        case 2:
            return UIEdgeInsets(top: 40, left: 0, bottom: 0, right: 0)
        default:
            return UIEdgeInsets.zero
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        switch collectionView.tag {
        case 1:
            return CGSize(width: 110, height: 24)
        case 2:
            return CGSize(width: 332, height: 105)
        default:
            return CGSize(width: 0, height: 0)
        }
    }
}

