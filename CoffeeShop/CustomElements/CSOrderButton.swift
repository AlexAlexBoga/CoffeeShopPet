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
        button.layer.cornerRadius = 24
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
        guard let action = self.action else { return }
        action()
    }
    
    private func setCollorScheme(scheme: CSOrderButtonCollorScheme) {
        switch scheme {
        case .onButton:
            button.backgroundColor = .gray
            button.setTitleColor(.black, for: .normal)
            button.layer.borderWidth = 2
            button.layer.borderColor = UIColor.white.cgColor
            button.layer.cornerRadius = 8
        case.offButton:
            button.backgroundColor = .backgroundCollection
            button.setTitleColor(.white, for: .normal)
        }
    }
    
    public func setTitle(_ title: String?) {
        button.setTitle(title, for: .normal)
    }
}

