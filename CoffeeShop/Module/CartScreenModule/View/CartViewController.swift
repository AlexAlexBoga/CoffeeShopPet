//
//  CartViewController.swift
//  CoffeeShop
//
//  Created by Александр Богачев on 26.08.24.
//

import UIKit

class CartViewController: UIViewController {
    
    weak var coordinator: MainCoordinator?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        
        // Кнопка для показа модального экрана
                let modalButton = UIButton(type: .system)
                modalButton.setTitle("Show Modal", for: .normal)
                modalButton.addTarget(self, action: #selector(showModal), for: .touchUpInside)
                modalButton.frame = CGRect(x: 50, y: 300, width: 200, height: 50)
                view.addSubview(modalButton)
    }
    
    @objc private func showModal() {
           let modalViewController = ModalViewController()
           modalViewController.modalPresentationStyle = .fullScreen  // Установка стиля презентации
           present(modalViewController, animated: true, completion: nil)
       }
  
}
