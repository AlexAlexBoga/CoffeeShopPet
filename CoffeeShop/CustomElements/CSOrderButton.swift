//
//  CSOrderButton.swift
//  CoffeeShop
//
//  Created by Александр Богачев on 29.08.24.
//

import UIKit

enum CSOrderButtonCollorScheme {
    case onButton
    case offButton
}

class CSOrderButton: UIView {
    
    private let button = UIButton()
    var action: (() -> Void)?
    var scheme: CSOrderButtonCollorScheme = .onButton {
        didSet {
            setCollorScheme(scheme: scheme)
        }
    }
    
    init(scheme: CSOrderButtonCollorScheme = .onButton) {
        super.init(frame: .zero)
        self.scheme = scheme
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLayout() {
        self.backgroundColor = .clear
        setupButton()
    }
    
    private func setupButton() {
        addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        button.layer.cornerRadius = 8
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            button.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            button.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            button.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            button.topAnchor.constraint(equalTo: self.topAnchor)
        ])
    }
    
    @objc
    private func buttonPressed() {
        action?()
    }
    
    private func setCollorScheme(scheme: CSOrderButtonCollorScheme) {
        switch scheme {
        case .onButton:
            button.backgroundColor = .orderButton
            button.setTitleColor(.orderText, for: .normal)
            button.layer.borderWidth = 2
            button.layer.borderColor = UIColor.orderText.cgColor
            button.layer.cornerRadius = 8
        case.offButton:
            button.backgroundColor = .orderButton
            button.setTitleColor(.orderText2, for: .normal)
            button.layer.borderWidth = 0
        }
    }
    
    public func setTitle(_ title: String?) {
        button.setTitle(title, for: .normal)
    }
    
}

