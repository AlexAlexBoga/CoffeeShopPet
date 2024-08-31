//
//  CSCounterButton.swift
//  CoffeeShop
//
//  Created by Александр Богачев on 29.08.24.
//

import UIKit

class CSCounterView: UIView {
    
    private let stackView = UIStackView()
    private let decrementButton = UIButton(type: .system)
    private let incrementButton = UIButton(type: .system)
    private let countLabel = UILabel()
    
    private var count: Int = 0 {
        didSet {
            updateCountLabel()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    private func setupView() {
        stackView.backgroundColor = .clear
        stackView.axis = .horizontal
        stackView.layer.cornerRadius = 24
        stackView.layer.borderWidth = 2
        if let borderColor = UIColor(named: "orderText") {
            stackView.layer.borderColor = borderColor.cgColor
        }
        
        stackView.distribution = .fillProportionally
        stackView.spacing = 0
        stackView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(stackView)
        
        decrementButton.setTitle("-", for: .normal)
        decrementButton.titleLabel?.font = .systemFont(ofSize: 16)
        decrementButton.setTitleColor(.orderText, for: .normal)
        decrementButton.addTarget(self, action: #selector(decrementTapped), for: .touchUpInside)
        stackView.addArrangedSubview(decrementButton)
        
        countLabel.text = "0"
        countLabel.font = .systemFont(ofSize: 16, weight: .bold)
        countLabel.textColor = .orderText
        countLabel.textAlignment = .center
        countLabel.widthAnchor.constraint(equalToConstant: 10).isActive = true
        stackView.addArrangedSubview(countLabel)
        
        incrementButton.setTitle("+", for: .normal)
        incrementButton.titleLabel?.font = .systemFont(ofSize: 16)
        incrementButton.setTitleColor(.orderText, for: .normal)
        incrementButton.addTarget(self, action: #selector(incrementTapped), for: .touchUpInside)
        stackView.addArrangedSubview(incrementButton)
        
        NSLayoutConstraint.activate([
                   stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
                   stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
                   stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
                   stackView.topAnchor.constraint(equalTo: self.topAnchor)
               ])
    }
    
    private func updateCountLabel() {
        countLabel.text = "\(count)"
    }
    
    @objc private func decrementTapped() {
        if count > 0 {
            count -= 1
        }
    }
    
    @objc private func incrementTapped() {
        count += 1
    }
}
