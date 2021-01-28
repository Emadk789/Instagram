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
        button.backgroundColor = .systemGreen
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.gray.cgColor
        
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)

        button.layer.masksToBounds = true
        button.layer.cornerRadius = 8
        
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    let loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Have an Account?  Login", for: .normal)
        button.setTitleColor(.gray, for: .normal)

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
        view.backgroundColor = .systemBackground
        usernameTextField.delegate = self
        passwordTextField.delegate = self
        emailTextField.delegate = self
    }
    
    override func viewDidLayoutSubviews() {
        addSubViews()
        configurStackViewAnchors()
        addTargets()
    }
    private func addSubViews() {
        stackView.addArrangedSubview(usernameTextField)
        stackView.addArrangedSubview(emailTextField)
        stackView.addArrangedSubview(passwordTextField)
        stackView.addArrangedSubview(signUpButton)
        view.addSubview(stackView)
        view.addSubview(loginButton)
        loginButton.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 10).isActive = true
        loginButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25).isActive = true
        loginButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25).isActive = true
        loginButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.05).isActive = true
    }
    private func configurStackViewAnchors() {
        stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100).isActive = true
        stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25).isActive = true
        stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25).isActive = true
        stackView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.3).isActive = true
    }
    private func addTargets() {
        signUpButton.addTarget(self, action: #selector(signUpButtonClicked), for: .touchUpInside)
        loginButton.addTarget(self, action: #selector(loginButtonClicked), for: .touchUpInside)
    }
    @objc func signUpButtonClicked() {
        emailTextField.resignFirstResponder()
        passwordTextField.resignFirstResponder()
        usernameTextField.resignFirstResponder()
        
        guard let email = emailTextField.text, email.contains("@"), email.contains("."), !email.isEmpty,
        let password = passwordTextField.text, password.count > 10, !password.isEmpty,
              let username = usernameTextField.text, username.count > 10, !username.isEmpty else {
            return
        }
        //TODO: Call the AuthManager
        
        print(#function)
    }
    @objc func loginButtonClicked() {
        dismiss(animated: true)
    }

}

extension RegistrationViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == passwordTextField {
            passwordTextField.resignFirstResponder()
            signUpButtonClicked()
        }
        else if textField == usernameTextField {
            emailTextField.becomeFirstResponder()
        }
        else if textField == emailTextField {
            passwordTextField.becomeFirstResponder()
        }
        return true
    }
}
