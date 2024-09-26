//
//  ProfileViewController.swift
//  CoffeeShop
//
//  Created by Александр Богачев on 26.08.24.
//

import UIKit

class ProfileViewController: UIViewController {

    private let userManager = UserManager()
    
    private let scrollView = UIScrollView()
    private let contentView = UIView()
    
    private let bottomView = UIView()
    private let profileLabel = CSLabel()
    private let nameLabel = CSLabel()
    private let addressLabel = CSLabel()
    private let emailLabel = CSLabel()
    private let phoneLabel = CSLabel()
    private var nameField = UITextField()
    private var addressField = UITextField()
    private var emailField = UITextField()
    private var phoneField = UITextField()
    private let saveButton = CSButton()
    private let logOutButton = CSButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .backgroud
        setupNaviagationBar()
        setupLayout()
        setProfile()
    }
    
    func setProfile() {
        let profile = ProfileManager.shared.loadProfile()

        nameField.text = profile.name
        addressField.text = profile.address
        emailField.text = profile.email
        phoneField.text = profile.phone
    }
    
    private func setupLayout() {
        setupScrollView()
        setupContentView()
        setupProfileLabel()
        setupBottomView()
        setupNameLabel()
        setupNameField()
        setupAddressLabel()
        setupAddressField()
        setupPhoneLabel()
        setupPhoneField()
        setupEmailLabel()
        setupEmailField()
        setupSaveButton()
        setupLogOutButton()
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
        scrollView.alwaysBounceVertical = true
        scrollView.isScrollEnabled = false
        
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.heightAnchor.constraint(equalTo: view.heightAnchor)
        ])

    }
    
    private func setupContentView() {
        scrollView.addSubview(contentView)
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: -100),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: 100),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            contentView.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 1.0)
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
    
    private func setupProfileLabel() {
        contentView.addSubview(profileLabel)
        profileLabel.translatesAutoresizingMaskIntoConstraints = false
        profileLabel.text = "Your Profile"
        
        NSLayoutConstraint.activate([
            profileLabel.topAnchor.constraint(equalTo: contentView.topAnchor,constant: 84),
            profileLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 30),
            profileLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -193),
        ])
    }
    
    private func setupBottomView() {
        contentView.addSubview(bottomView)
        bottomView.translatesAutoresizingMaskIntoConstraints = false
        bottomView.backgroundColor = .itemBackground
        bottomView.layer.cornerRadius = 9
        
        NSLayoutConstraint.activate([
            bottomView.topAnchor.constraint(equalTo: profileLabel.bottomAnchor, constant: 30),
            bottomView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            bottomView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            bottomView.heightAnchor.constraint(equalToConstant: 350)
            
        ])
    }
    
    private func setupNameLabel() {
        bottomView.addSubview(nameLabel)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.text = "Name:"
        
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: bottomView.topAnchor, constant: 30),
            nameLabel.leadingAnchor.constraint(equalTo: bottomView.leadingAnchor, constant: 10),
            nameLabel.trailingAnchor.constraint(equalTo: bottomView.trailingAnchor, constant: -10),
            
        ])
    }
    
    private func setupNameField() {
        bottomView.addSubview(nameField)
        nameField.translatesAutoresizingMaskIntoConstraints = false
        nameField.text = "Name"
        nameField.textAlignment = .left
        
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: nameField.frame.height))
            nameField.leftView = paddingView
            nameField.leftViewMode = .always

        NSLayoutConstraint.activate([
            nameField.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 5),
            nameField.leadingAnchor.constraint(equalTo: bottomView.leadingAnchor),
            nameField.trailingAnchor.constraint(equalTo: bottomView.trailingAnchor),
        ])
    }

    private func setupAddressLabel() {
        bottomView.addSubview(addressLabel)
        addressLabel.translatesAutoresizingMaskIntoConstraints = false
        addressLabel.text = "Address:"
        
        NSLayoutConstraint.activate([
            addressLabel.topAnchor.constraint(equalTo: nameField.bottomAnchor, constant: 30),
            addressLabel.leadingAnchor.constraint(equalTo: bottomView.leadingAnchor, constant: 10),
            addressLabel.trailingAnchor.constraint(equalTo: bottomView.trailingAnchor, constant: -10),
            
        ])
    }
    
    private func setupAddressField() {
        bottomView.addSubview(addressField)
        addressField.translatesAutoresizingMaskIntoConstraints = false
        addressField.text = "Address"
        addressField.textAlignment = .left
        
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: addressField.frame.height))
        addressField.leftView = paddingView
        addressField.leftViewMode = .always

        NSLayoutConstraint.activate([
            addressField.topAnchor.constraint(equalTo: addressLabel.bottomAnchor, constant: 5),
            addressField.leadingAnchor.constraint(equalTo: bottomView.leadingAnchor),
            addressField.trailingAnchor.constraint(equalTo: bottomView.trailingAnchor),
        ])
    }

    private func setupPhoneLabel() {
        bottomView.addSubview(phoneLabel)
        phoneLabel.translatesAutoresizingMaskIntoConstraints = false
        phoneLabel.text = "Phone:"
        
        NSLayoutConstraint.activate([
            phoneLabel.topAnchor.constraint(equalTo: addressField.bottomAnchor, constant: 30),
            phoneLabel.leadingAnchor.constraint(equalTo: bottomView.leadingAnchor, constant: 10),
            phoneLabel.trailingAnchor.constraint(equalTo: bottomView.trailingAnchor, constant: -10),
            
        ])
    }
    
    private func setupPhoneField() {
        bottomView.addSubview(phoneField)
        phoneField.translatesAutoresizingMaskIntoConstraints = false
        phoneField.text = "Phone"
        phoneField.textAlignment = .left
        
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: addressField.frame.height))
        phoneField.leftView = paddingView
        phoneField.leftViewMode = .always

        NSLayoutConstraint.activate([
            phoneField.topAnchor.constraint(equalTo: phoneLabel.bottomAnchor, constant: 5),
            phoneField.leadingAnchor.constraint(equalTo: bottomView.leadingAnchor),
            phoneField.trailingAnchor.constraint(equalTo: bottomView.trailingAnchor),
        ])
    }

    private func setupEmailLabel() {
        bottomView.addSubview(emailLabel)
        emailLabel.translatesAutoresizingMaskIntoConstraints = false
        emailLabel.text = "Email:"
        
        NSLayoutConstraint.activate([
            emailLabel.topAnchor.constraint(equalTo: phoneField.bottomAnchor, constant: 30),
            emailLabel.leadingAnchor.constraint(equalTo: bottomView.leadingAnchor, constant: 10),
            emailLabel.trailingAnchor.constraint(equalTo: bottomView.trailingAnchor, constant: -10),
            
        ])
    }
    
    private func setupEmailField() {
        bottomView.addSubview(emailField)
        emailField.translatesAutoresizingMaskIntoConstraints = false
        emailField.text = "Phone"
        emailField.textAlignment = .left
        
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: emailField.frame.height))
        emailField.leftView = paddingView
        emailField.leftViewMode = .always

        NSLayoutConstraint.activate([
            emailField.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: 5),
            emailField.leadingAnchor.constraint(equalTo: bottomView.leadingAnchor),
            emailField.trailingAnchor.constraint(equalTo: bottomView.trailingAnchor),
        ])
    }
    
    private func setupSaveButton() {
        contentView.addSubview(saveButton)
        saveButton.translatesAutoresizingMaskIntoConstraints = false
        saveButton.scheme = .white
        saveButton.setTitle("Save Profile")
        saveButton.action = { [weak self] in
            self?.saveButtonPressed()
        }
                
        NSLayoutConstraint.activate([
            saveButton.topAnchor.constraint(equalTo: bottomView.bottomAnchor, constant: 180),
            saveButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 30),
            saveButton.heightAnchor.constraint(equalToConstant: 47),
            saveButton.widthAnchor.constraint(equalToConstant: 145)
        ])
    }
    func saveButtonPressed() {
        print("saveButtonPressed")
        let profile = Profile(
            name: nameField.text ?? "",
            address: addressField.text ?? "",
            phone: phoneField.text ?? "",
            email: emailField.text ?? ""
        )
        ProfileManager.shared.save(profile)
    }
    
    private func setupLogOutButton() {
        contentView.addSubview(logOutButton)
        logOutButton.translatesAutoresizingMaskIntoConstraints = false
        logOutButton.scheme = .white
        logOutButton.setTitle("Delete Profile")
        logOutButton.action = { [weak self] in
            self?.logOutButtonPressed()
        }
                
        NSLayoutConstraint.activate([
            logOutButton.topAnchor.constraint(equalTo: bottomView.bottomAnchor, constant: 180),
            logOutButton.heightAnchor.constraint(equalToConstant: 47),
            logOutButton.widthAnchor.constraint(equalToConstant: 145),
            logOutButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -30)
        ])
    }
    func logOutButtonPressed() {
        print("logOutButtonPressed")
        ProfileManager.shared.clear()
        setProfile()
        userManager.deleteUser()
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
        
        let textFields = [nameField,
                          addressField,
                          phoneField,
                          emailField
                          ]
        
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
