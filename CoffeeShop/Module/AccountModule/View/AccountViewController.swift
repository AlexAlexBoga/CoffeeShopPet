//
//  AccountViewController.swift
//  CoffeeShop
//
//  Created by Александр Богачев on 15.09.24.
//

import UIKit

class AccountViewController: UIViewController {
    
    private let backGroundImage = CSBackGroundView()
    private let welcomeLabel = UILabel()
    private let emailLabel = UILabel()
    private let passwordLabel = UILabel()
    private let emailTextField = UITextField()
    private let passwordTextField = UITextField()
    private let emailUnderLineView = UIView()
    private let passwordUnderLineView = UIView()
    private let emailStackView = UIStackView()
    private let passwordStackView = UIStackView()
    private let createButton = CSButton()
    private let confirmLabel = UILabel()
    private let confirmTextField = UITextField()
    private let confirmUnderLineView = UIView()
    private let confirmStackView = UIStackView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
    }
    
    private func setupLayout() {
        setupBackGroundImage()
        setupWelcomeLabel()
        setupEmailStackView()
        setupPasswordStackView()
        setupConfirmStackView()
        setupCreateButton()
    }
    
    private func setupBackGroundImage() {
        view.addSubview(backGroundImage)
        backGroundImage.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            backGroundImage.topAnchor.constraint(equalTo: view.topAnchor),
            backGroundImage.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            backGroundImage.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backGroundImage.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
    }
    
    private func setupWelcomeLabel() {
        view.addSubview(welcomeLabel)
        welcomeLabel.translatesAutoresizingMaskIntoConstraints = false
        welcomeLabel.lineBreakMode = .byWordWrapping
        welcomeLabel.text = "Create account"
        welcomeLabel.textColor = .black
        welcomeLabel.font = UIFont.systemFont(ofSize: 36, weight: .bold)
        welcomeLabel.textAlignment = .left
        
        NSLayoutConstraint.activate([
            welcomeLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 350),
            welcomeLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            welcomeLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
        ])
    }
    
    private func setupEmailStackView() {
        emailLabel.text = "Email"
        emailLabel.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        
        emailUnderLineView.backgroundColor = .gray
        
        emailTextField.placeholder = "Email"
        emailTextField.font = UIFont.systemFont(ofSize: 15)
        emailTextField.textColor = UIColor.black
        
        emailStackView.addArrangedSubview(emailLabel)
        emailStackView.addArrangedSubview(emailTextField)
        emailStackView.addArrangedSubview(emailUnderLineView)
        
        view.addSubview(emailStackView)
        emailStackView.translatesAutoresizingMaskIntoConstraints = false
        
        emailStackView.backgroundColor = .clear
        emailStackView.axis = .vertical
        emailStackView.spacing = 10
        emailStackView.alignment = .fill
        
        NSLayoutConstraint.activate([
            emailStackView.topAnchor.constraint(equalTo: welcomeLabel.bottomAnchor, constant: 25),
            emailStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            emailStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),

            emailUnderLineView.bottomAnchor.constraint(equalTo: emailStackView.bottomAnchor),
            emailUnderLineView.leadingAnchor.constraint(equalTo: emailStackView.leadingAnchor),
            emailUnderLineView.trailingAnchor.constraint(equalTo: emailStackView.trailingAnchor),
            emailUnderLineView.heightAnchor.constraint(equalToConstant: 1),
        ])
    }
    
    private func setupPasswordStackView() {
        passwordLabel.text = "Password"
        passwordLabel.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        
        passwordUnderLineView.backgroundColor = .gray
        
        passwordTextField.placeholder = "Password"
        passwordTextField.font = UIFont.systemFont(ofSize: 15)
        passwordTextField.textColor = UIColor.black
        
        passwordStackView.addArrangedSubview(passwordLabel)
        passwordStackView.addArrangedSubview(passwordTextField)
        passwordStackView.addArrangedSubview(passwordUnderLineView)
        
        view.addSubview(passwordStackView)
        passwordStackView.translatesAutoresizingMaskIntoConstraints = false
        
        passwordStackView.backgroundColor = .clear
        passwordStackView.axis = .vertical
        passwordStackView.spacing = 10
        passwordStackView.alignment = .fill
        
        NSLayoutConstraint.activate([
            passwordStackView.topAnchor.constraint(equalTo: emailStackView.bottomAnchor, constant: 13),
            passwordStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            passwordStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),

            passwordUnderLineView.bottomAnchor.constraint(equalTo: passwordStackView.bottomAnchor),
            passwordUnderLineView.leadingAnchor.constraint(equalTo: passwordStackView.leadingAnchor),
            passwordUnderLineView.trailingAnchor.constraint(equalTo: passwordStackView.trailingAnchor),
            passwordUnderLineView.heightAnchor.constraint(equalToConstant: 1),
        ])
    }
    
    private func setupConfirmStackView() {
        confirmLabel.text = "Confirm password"
        confirmLabel.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        
        confirmUnderLineView.backgroundColor = .gray
        
        confirmTextField.placeholder = "Password"
        confirmTextField.font = UIFont.systemFont(ofSize: 15)
        confirmTextField.textColor = UIColor.black
        
        confirmStackView.addArrangedSubview(confirmLabel)
        confirmStackView.addArrangedSubview(confirmTextField)
        confirmStackView.addArrangedSubview(confirmUnderLineView)
        
        view.addSubview(confirmStackView)
        confirmStackView.translatesAutoresizingMaskIntoConstraints = false
        
        confirmStackView.backgroundColor = .clear
        confirmStackView.axis = .vertical
        confirmStackView.spacing = 10
        confirmStackView.alignment = .fill
        
        NSLayoutConstraint.activate([
            confirmStackView.topAnchor.constraint(equalTo: passwordStackView.bottomAnchor, constant: 13),
            confirmStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            confirmStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),

            confirmUnderLineView.bottomAnchor.constraint(equalTo: confirmStackView.bottomAnchor),
            confirmUnderLineView.leadingAnchor.constraint(equalTo: confirmStackView.leadingAnchor),
            confirmUnderLineView.trailingAnchor.constraint(equalTo: confirmUnderLineView.trailingAnchor),
            confirmUnderLineView.heightAnchor.constraint(equalToConstant: 1),
        ])
    }
    
    private func setupCreateButton() {
        view.addSubview(createButton)
        createButton.translatesAutoresizingMaskIntoConstraints = false
        createButton.scheme = .black
        createButton.setTitle("Create an account")
        createButton.action = { [weak self] in
            self?.createButtonPressed()
        }
                
        NSLayoutConstraint.activate([
            createButton.topAnchor.constraint(equalTo: confirmUnderLineView.bottomAnchor, constant: 76),
            createButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            createButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            createButton.heightAnchor.constraint(equalToConstant: 50),
        ])
    }
    func createButtonPressed() {
        print("createButtonPressed")
//        viewOutput.goToProfileVC()
       
    }
}
