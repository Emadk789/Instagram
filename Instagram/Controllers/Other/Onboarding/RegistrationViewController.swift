//
//  RegistrationViewController.swift
//  Instagram
//
//  Created by Emad Albarnawi on 13/01/2021.
//

import UIKit

class RegistrationViewController: UIViewController {
    
    let usernameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Username"
        textField.backgroundColor = .secondarySystemBackground
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.gray.cgColor
        
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        textField.leftViewMode = .always
        textField.autocapitalizationType = .none
        textField.autocorrectionType = .no
        textField.layer.masksToBounds = true
        textField.layer.cornerRadius = 8
        
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    let emailTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Email"
        textField.backgroundColor = .secondarySystemBackground
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.gray.cgColor
        
        
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        textField.leftViewMode = .always
        textField.autocapitalizationType = .none
        textField.autocorrectionType = .no
        textField.layer.masksToBounds = true
        textField.layer.cornerRadius = 8
        
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Passowrd"
        textField.backgroundColor = .secondarySystemBackground
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.gray.cgColor
        
        
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        textField.leftViewMode = .always
        textField.autocapitalizationType = .none
        textField.autocorrectionType = .no
        textField.layer.masksToBounds = true
        textField.layer.cornerRadius = 8
        textField.isSecureTextEntry = true
        
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    let signUpButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Sign UP", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.gray.cgColor
        
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)

        button.layer.masksToBounds = true
        button.layer.cornerRadius = 8
        
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    let stackView: UIStackView = {
        let stack = UIStackView()
        stack.distribution = .fillEqually
        stack.axis = .vertical
        stack.spacing = 10
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidLayoutSubviews() {
        addSubViews()
        configurStackViewAnchors()
    }
    private func addSubViews() {
        stackView.addArrangedSubview(usernameTextField)
        stackView.addArrangedSubview(emailTextField)
        stackView.addArrangedSubview(passwordTextField)
        stackView.addArrangedSubview(signUpButton)
        view.addSubview(stackView)
    }
    private func configurStackViewAnchors() {
        stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100).isActive = true
        stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25).isActive = true
        stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25).isActive = true
        stackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -300).isActive = true
    }

}
