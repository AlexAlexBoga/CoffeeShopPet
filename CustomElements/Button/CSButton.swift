//
//  CSButton.swift
//  CoffeeShop
//
//  Created by Александр Богачев on 26.08.24.
//

import UIKit

enum CSButtonCollorScheme {
    case white
    case black
}

class CSButton: UIView {
    
    private let button = UIButton()
    var action: (() -> Void)?
    var scheme: CSButtonCollorScheme = .white {
        didSet {
            setCollorScheme(scheme: scheme)
        }
    }
    
    init(scheme: CSButtonCollorScheme = .white) {
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
    
    private func setCollorScheme(scheme: CSButtonCollorScheme) {
        switch scheme {
        case .white:
            button.backgroundColor = .clear
            button.setTitleColor(.black, for: .normal)
            button.layer.borderWidth = 2
            button.layer.borderColor = UIColor.black.cgColor
            button.layer.cornerRadius = 24
        case.black:
            button.backgroundColor = .black
            button.setTitleColor(.white, for: .normal)
        }
    }
    
    public func setTitle(_ title: String?) {
        button.setTitle(title, for: .normal)
    }
}


