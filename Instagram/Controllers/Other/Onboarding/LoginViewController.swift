//
//  LoginViewController.swift
//  Instagram
//
//  Created by Emad Albarnawi on 13/01/2021.
//

import UIKit

class LoginViewController: UIViewController {
    
    struct Constants {
        static let cornerRadius: CGFloat = 8.0
    }
    
    private let usernameEmailTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Username or Email"
        textField.returnKeyType = .next
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        textField.rightView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        textField.autocapitalizationType = .none
        textField.autocorrectionType = .no
        textField.layer.masksToBounds = true
        textField.layer.cornerRadius = Constants.cornerRadius
        textField.backgroundColor = .secondarySystemBackground
        
        return textField
    }()
    private let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.isSecureTextEntry = true
        
        textField.placeholder = "Password"
        textField.returnKeyType = .next
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        textField.rightView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        textField.autocapitalizationType = .none
        textField.autocorrectionType = .no
        textField.layer.masksToBounds = true
        textField.layer.cornerRadius = Constants.cornerRadius
        textField.backgroundColor = .secondarySystemBackground
        
        return textField
    }()
    private let loginButton: UIButton = {
        let button = UIButton()
        button.setTitle("Login", for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.masksToBounds = true
        button.layer.cornerRadius = Constants.cornerRadius
        button.setTitleColor(.white, for: .normal)
        
        
        return button
    }()
    private let termsButton: UIButton = {
        let button = UIButton()
        
        
        return button
    }()
    private let createAccountButton: UIButton = {
        let button = UIButton()
        button.setTitle("New User? Create an Account", for: .normal)
        button.setTitleColor(.label, for: .normal)
        return button
    }()
    private let privacyButton: UIButton = {
        let button = UIButton()
        
        
        return button
    }()
    private let headerView: UIView = {
        let view = UIView()
        view.clipsToBounds = true
        view.backgroundColor = .systemPink
        
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.backgroundColor = .systemBackground
        addSubViews()
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        _ = headerView.left
        _ = headerView.buttom
//        _ = headerView.left
//        _ = headerView.left
        headerView.frame = CGRect(
            x: 0,
            y: view.safeAreaInsets.top,
            width: view.width,
            height: view.height/3)
        usernameEmailTextField.frame = CGRect(x: 50, y: 100, width: view.width, height: 30)
        passwordTextField.frame = CGRect(x: 50, y: 138, width: view.width, height: 30)
    }
    private func addSubViews() {
        view.addSubview(usernameEmailTextField)
        view.addSubview(passwordTextField)
        view.addSubview(loginButton)
        view.addSubview(createAccountButton)
        view.addSubview(privacyButton)
        view.addSubview(headerView)
        view.addSubview(termsButton)
    }
    
    @objc private func loginButtonClicked() {
        
    }
    @objc private func createAccountButtonClicked() {
        
    }
    @objc private func privacyButtonClicked() {
        
    }
    @objc private func termsButtonClicked() {
        
    }
}
