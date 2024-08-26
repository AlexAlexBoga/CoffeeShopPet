//
//  LoginViewController.swift
//  CoffeeShop
//
//  Created by Александр Богачев on 26.08.24.
//

import UIKit

class LoginViewController: UIViewController {
    
    private let backGroundImage = CSBackGroundView()
    private let welcomeLabel = UILabel()
    private let loginButton = CSButton()
    private let createButton = CSButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
    }
    
    private func setupLayout() {
        setupBackGroundImage()
        setupWelcomeLabel()
        setupLoginButton()
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
        welcomeLabel.numberOfLines = 0
        welcomeLabel.lineBreakMode = .byWordWrapping
        welcomeLabel.text = "Welcome Back!"
        welcomeLabel.textColor = .black
        welcomeLabel.font = UIFont.systemFont(ofSize: 36, weight: .bold)
        welcomeLabel.textAlignment = .left
        
        NSLayoutConstraint.activate([
            welcomeLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 350),
            welcomeLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            welcomeLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -155),
        ])
    }
    
    private func setupLoginButton() {
        view.addSubview(loginButton)
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        loginButton.scheme = .black
        loginButton.setTitle("Login")
        loginButton.action = { [weak self] in
            self?.loginButtonPressed()
        }
                
        NSLayoutConstraint.activate([
            loginButton.topAnchor.constraint(equalTo: welcomeLabel.bottomAnchor, constant: 207),
            loginButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            loginButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            loginButton.heightAnchor.constraint(equalToConstant: 50),
        ])
    }
    func loginButtonPressed() {
        print("loginButtonPressed")
    }
    
    private func setupCreateButton() {
        view.addSubview(createButton)
        createButton.translatesAutoresizingMaskIntoConstraints = false
        createButton.scheme = .white
        createButton.setTitle("Create an account")
        createButton.action = { [weak self] in
            self?.createButtonPressed()
        }
                
        NSLayoutConstraint.activate([
            createButton.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 27),
            createButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            createButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            createButton.heightAnchor.constraint(equalToConstant: 50),
        ])
    }
    func createButtonPressed() {
        print("createButtonPressed")
    }
}
