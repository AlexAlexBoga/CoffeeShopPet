//
//  ModalViewController.swift
//  CoffeeShop
//
//  Created by Александр Богачев on 29.08.24.
//

import UIKit

class ModalViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Modal Screen"
        
        // Кнопка для закрытия модального экрана
        let closeButton = UIButton(type: .system)
        closeButton.setTitle("Close", for: .normal)
        closeButton.addTarget(self, action: #selector(dismissModal), for: .touchUpInside)
        closeButton.center = view.center
        closeButton.frame.size = CGSize(width: 200, height: 50)
        view.addSubview(closeButton)
    }
    
    @objc private func dismissModal() {
        dismiss(animated: true, completion: nil)
    }
}
