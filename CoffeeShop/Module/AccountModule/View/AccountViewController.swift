//
//  AccountViewController.swift
//  CoffeeShop
//
//  Created by Александр Богачев on 15.09.24.
//

import UIKit

protocol AccountViewProtocol: AnyObject {
    func showError(_ message: String)
    func showSuccess(_ message: String)
}

class AccountViewController: UIViewController {
    
    private var presenter: AccountPresenterProtocol!
    
    private let scrollView = UIScrollView()
    private let contentView = UIView()
    
    private let backGroundImage = UIImageView()//CSBackGroundView()
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
        setupNaviagationBar()
        setupLayout()
        presenter = AccountPresenter(view: self)
    }
    
    private func setupLayout() {
        setupBackGroundImage()
        setupScrollView()
        setupContentView()
        setupWelcomeLabel()
        setupEmailStackView()
        setupPasswordStackView()
        setupConfirmStackView()
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
        welcomeLabel.lineBreakMode = .byWordWrapping
        welcomeLabel.text = "Create account"
        welcomeLabel.textColor = .black
        welcomeLabel.font = UIFont.systemFont(ofSize: 36, weight: .bold)
        welcomeLabel.textAlignment = .left
        
        NSLayoutConstraint.activate([
            welcomeLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 350),
            welcomeLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 30),
            welcomeLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -30),
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
            emailStackView.topAnchor.constraint(equalTo: welcomeLabel.bottomAnchor, constant: 25),
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
        
        contentView.addSubview(confirmStackView)
        confirmStackView.translatesAutoresizingMaskIntoConstraints = false
        
        confirmStackView.backgroundColor = .clear
        confirmStackView.axis = .vertical
        confirmStackView.spacing = 10
        confirmStackView.alignment = .fill
        
        NSLayoutConstraint.activate([
            confirmStackView.topAnchor.constraint(equalTo: passwordStackView.bottomAnchor, constant: 13),
            confirmStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 30),
            confirmStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -30),

            confirmUnderLineView.bottomAnchor.constraint(equalTo: confirmStackView.bottomAnchor),
            confirmUnderLineView.leadingAnchor.constraint(equalTo: confirmStackView.leadingAnchor),
            confirmUnderLineView.trailingAnchor.constraint(equalTo: confirmUnderLineView.trailingAnchor),
            confirmUnderLineView.heightAnchor.constraint(equalToConstant: 1),
        ])
    }
    
    private func setupCreateButton() {
        contentView.addSubview(createButton)
        createButton.translatesAutoresizingMaskIntoConstraints = false
        createButton.scheme = .black
        createButton.setTitle("Create an account")
        createButton.action = { [weak self] in
            self?.createButtonPressed()
        }
                
        NSLayoutConstraint.activate([
            createButton.topAnchor.constraint(equalTo: confirmUnderLineView.bottomAnchor, constant: 76),
            createButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 30),
            createButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -30),
            createButton.heightAnchor.constraint(equalToConstant: 50),
        ])
    }
    func createButtonPressed() {
        print("createButtonPressed")
        guard let email = emailTextField.text,
              let password = passwordTextField.text,
              let confirmPassword = confirmTextField.text else {
            return
        }
        presenter.registerUser(email: email, password: password, confirmPassword: confirmPassword)
        
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
                          passwordTextField,
                          confirmTextField]
        
        if let firstResponder = textFields
            .first(where: \.isFirstResponder) {
            
            let frame = firstResponder.frame.inset(by: UIEdgeInsets(top: -10,
                                                                    left: -10,
                                                                    bottom: -10,
                                                                    right: -10))
            
            let newOrigin = scrollView.convert(frame.origin, from: firstResponder.superview)
            let newFrame = CGRect(origin: newOrigin, size: frame.size)
            
            scrollView.scrollRectToVisible(newFrame, animated: true)
        }
    }
}


extension AccountViewController: AccountViewProtocol {
    func showError(_ message: String) {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
               alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
               present(alert, animated: true, completion: nil)
    }
    
    func showSuccess(_ message: String) {
        let alert = UIAlertController(title: "Success", message: message, preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                present(alert, animated: true, completion: nil)
    }
    
    
}
