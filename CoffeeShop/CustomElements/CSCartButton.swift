//
//  CSCartButton.swift
//  CoffeeShop
//
//  Created by Александр Богачев on 30.08.24.
//

import UIKit

enum CSCartButtonColorScheme {
    case white
    case black
}

class CSCartButton: UIView {
    
    private let button = UIButton()
    var action: (() -> Void)?
    var scheme: CSCartButtonColorScheme = .white {
        didSet {
            setCollorScheme(scheme: scheme)
        }
    }
    
    init(scheme: CSCartButtonColorScheme = .white) {
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
        button.titleLabel?.font = UIFont.systemFont(ofSize: 11, weight: .semibold)
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
        scheme = (scheme == .white) ? .black : .white
        guard let action = self.action else { return }
        action()
    }
    
    private func setCollorScheme(scheme: CSCartButtonColorScheme) {
        switch scheme {
        case .white:
            button.backgroundColor = .orderButton
            button.setTitleColor(.orderText, for: .normal)
            button.layer.cornerRadius = 8
        case.black:
            button.backgroundColor = .backgroud
            button.setTitleColor(.black, for: .normal)
            button.layer.borderWidth = 2
            button.layer.borderColor = UIColor.black.cgColor
        }
    }
    
    public func setTitle(_ title: String?) {
        button.setTitle(title, for: .normal)
    }
}


