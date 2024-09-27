//
//  LoginViewController.swift
//  CoffeeShop
//
//  Created by Александр Богачев on 26.08.24.
//

import UIKit

class LoginViewController: UIViewController {
    
    var viewOutput: LoginViewOutput!
    
    init(viewOutput: LoginViewOutput!) {
        super .init(nibName: nil, bundle: nil)
        self.viewOutput = viewOutput
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let scrollView = UIScrollView()
    private let contentView = UIView()
    
    private let backGroundImage = UIImageView()
    private let welcomeLabel = UILabel()
    private let emailLabel = UILabel()
    private let passwordLabel = UILabel()
    private let emailTextField = UITextField()
    private let passwordTextField = UITextField()
    private let emailUnderLineView = UIView()
    private let passwordUnderLineView = UIView()
    private let emailStackView = UIStackView()
    private let passwordStackView = UIStackView()
    private let loginButton = CSButton()
    private let createButton = CSButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNaviagationBar()
        setupLayout()
    }
    
    private func setupLayout() {
        setupBackGroundImage()
        setupScrollView()
        setupContentView()
        setupWelcomeLabel()
        setupEmailStackView()
        setupPasswordStackView()
        setupLoginButton()
        setupCreateButton()
        setupKeyboard()
    }
    
    private func setupNaviagationBar() {
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isTranslucent = true
        navigationController?.navigationBar.backgroundColor = .clear
    }
    
    private func setupScrollView() {
        view.addSubview(scrollView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.backgroundColor = .clear
        scrollView.alwaysBounceVertical = false
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor, constant: -10),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
    }
    
    private func setupContentView() {
        scrollView.addSubview(contentView)
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: -100),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
        ])
    }
    
    private func setupKeyboard() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(backgroundTapped(_:)))
        
        view.addGestureRecognizer(tapGesture)
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardWillChangeFrame(_:)),
                                               name: UIResponder.keyboardWillChangeFrameNotification,
                                               object: nil)
    }
    
    private func setupBackGroundImage() {
        scrollView.addSubview(backGroundImage)
        backGroundImage.translatesAutoresizingMaskIntoConstraints = false
        backGroundImage.image = UIImage(named: "backgroundImage")
        backGroundImage.contentMode = .scaleAspectFill
        backGroundImage.clipsToBounds = false
        
        NSLayoutConstraint.activate([
            backGroundImage.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: -100),
            backGroundImage.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: 40),
            backGroundImage.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            backGroundImage.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            backGroundImage.heightAnchor.constraint(equalTo: scrollView.heightAnchor)
        ])
    }
    
    private func setupWelcomeLabel() {
        contentView.addSubview(welcomeLabel)
        welcomeLabel.translatesAutoresizingMaskIntoConstraints = false
        welcomeLabel.numberOfLines = 0
        welcomeLabel.lineBreakMode = .byWordWrapping
        welcomeLabel.text = "Welcome Back!"
        welcomeLabel.textColor = .black
        welcomeLabel.font = UIFont.systemFont(ofSize: 36, weight: .bold)
        welcomeLabel.textAlignment = .left
        
        NSLayoutConstraint.activate([
            welcomeLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 350),
            welcomeLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 30),
            welcomeLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -155),
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
        
        contentView.addSubview(emailStackView)
        emailStackView.translatesAutoresizingMaskIntoConstraints = false
        
        emailStackView.backgroundColor = .clear
        emailStackView.axis = .vertical
        emailStackView.spacing = 10
        emailStackView.alignment = .fill
        
        NSLayoutConstraint.activate([
            emailStackView.topAnchor.constraint(equalTo: welcomeLabel.bottomAnchor, constant: 13),
            emailStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 30),
            emailStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -30),
            
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
        
        contentView.addSubview(passwordStackView)
        passwordStackView.translatesAutoresizingMaskIntoConstraints = false
        
        passwordStackView.backgroundColor = .clear
        passwordStackView.axis = .vertical
        passwordStackView.spacing = 10
        passwordStackView.alignment = .fill
        
        NSLayoutConstraint.activate([
            passwordStackView.topAnchor.constraint(equalTo: emailStackView.bottomAnchor, constant: 13),
            passwordStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 30),
            passwordStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -30),
            
            passwordUnderLineView.bottomAnchor.constraint(equalTo: passwordStackView.bottomAnchor),
            passwordUnderLineView.leadingAnchor.constraint(equalTo: passwordStackView.leadingAnchor),
            passwordUnderLineView.trailingAnchor.constraint(equalTo: passwordStackView.trailingAnchor),
            passwordUnderLineView.heightAnchor.constraint(equalToConstant: 1),
        ])
    }
    
    private func setupLoginButton() {
        contentView.addSubview(loginButton)
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        loginButton.scheme = .black
        loginButton.setTitle("Login")
        loginButton.action = { [weak self] in
            self?.loginButtonPressed()
        }
        
        NSLayoutConstraint.activate([
            loginButton.topAnchor.constraint(equalTo: passwordStackView.bottomAnchor, constant: 42),
            loginButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 30),
            loginButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -30),
            loginButton.heightAnchor.constraint(equalToConstant: 50),
        ])
    }
    func loginButtonPressed() {
        print("loginButtonPressed")
        guard let email = emailTextField.text,
              let password = passwordTextField.text else {
            return
        }
        viewOutput.loginUser(with: email, password: password)
    }
    
    private func setupCreateButton() {
        contentView.addSubview(createButton)
        createButton.translatesAutoresizingMaskIntoConstraints = false
        createButton.scheme = .white
        createButton.setTitle("Create an account")
        createButton.action = { [weak self] in
            self?.createButtonPressed()
        }
        
        NSLayoutConstraint.activate([
            createButton.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 27),
            createButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 30),
            createButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -30),
            createButton.heightAnchor.constraint(equalToConstant: 50),
        ])
    }
    func createButtonPressed() {
        print("createButtonPressed")
        viewOutput.goToProfileVC()
    }
    
    @objc func backgroundTapped(_ sender: UITapGestureRecognizer) {
        contentView.endEditing(false)
    }
    
    @objc
    func keyboardWillChangeFrame(_ notification: NSNotification) {
        guard let keyboardFrame = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect else {
            return
        }
        
        scrollView.contentInset = UIEdgeInsets(top: 0.0, left: 0.0,
                                               bottom: scrollView.frame.maxY - keyboardFrame.minY, right: 0.0)
        
        let textFields = [emailTextField,
                          passwordTextField,]
        
        if let firstResponder = textFields
            .first(where: \.isFirstResponder) {
            
            let frame = firstResponder.frame.inset(by: UIEdgeInsets(top: -10,
                                                                    left: -10,
                                                                    bottom: -80,
                                                                    right: -10))
            
            let newOrigin = scrollView.convert(frame.origin, from: firstResponder.superview)
            let newFrame = CGRect(origin: newOrigin, size: frame.size)
            
            scrollView.scrollRectToVisible(newFrame, animated: true)
        }
    }
}
