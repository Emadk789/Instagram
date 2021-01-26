//
//  LoginViewController.swift
//  Instagram
//
//  Created by Emad Albarnawi on 13/01/2021.
//

import UIKit
import SafariServices

class LoginViewController: UIViewController {
    
    struct Constants {
        static let cornerRadius: CGFloat = 8.0
    }
    
    private let usernameEmailTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Username or Email"
        textField.returnKeyType = .next
        textField.layoutMargins = .init(top: 0, left: 20, bottom: 0, right: 0)
        let padding = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 0)
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        textField.leftViewMode = .always
        textField.autocapitalizationType = .none
        textField.autocorrectionType = .no
        textField.layer.masksToBounds = true
        textField.layer.cornerRadius = Constants.cornerRadius
        textField.backgroundColor = .secondarySystemBackground
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.secondaryLabel.cgColor
        
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        return textField
    }()
    private let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.isSecureTextEntry = true
        
        textField.placeholder = "Password"
        textField.returnKeyType = .done
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        textField.leftViewMode = .always
        textField.autocapitalizationType = .none
        textField.autocorrectionType = .no
        textField.layer.masksToBounds = true
        textField.layer.cornerRadius = Constants.cornerRadius
        textField.backgroundColor = .secondarySystemBackground
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.secondaryLabel.cgColor
        
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        return textField
    }()
    private let loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Login", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        button.backgroundColor = .systemBlue
        button.layer.masksToBounds = true
        button.layer.cornerRadius = Constants.cornerRadius
        button.setTitleColor(.white, for: .normal)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    private let termsButton: UIButton = {
        let button = UIButton()
        button.setTitle("Terms of Serviece", for: .normal)
        button.setTitleColor(.secondaryLabel, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    private let createAccountButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("New User? Create an Account", for: .normal)
        button.setTitleColor(.label, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    private let privacyButton: UIButton = {
        let button = UIButton()
        button.setTitle("Pricacy Policy", for: .normal)
        button.setTitleColor(.secondaryLabel, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    private let headerView: UIView = {
        let view = UIView()
        view.clipsToBounds = true
        view.backgroundColor = .systemPink
        let backgroundImageView = UIImageView()
        backgroundImageView.image = #imageLiteral(resourceName: "instagram-gradient")
        backgroundImageView.contentMode = .scaleToFill
        backgroundImageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(backgroundImageView)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    private let body: UIView = {
        let view = UIView()
        view.backgroundColor = .systemBackground
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let stackView: UIStackView = {
       let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution  = .fillEqually
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints =  false
        return stackView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
        usernameEmailTextField.delegate = self
        passwordTextField.delegate = self
        addSubViews()
        connectButtonToFunc()
    }
    private func addSubViews() {
        view.addSubview(headerView)
        stackView.addArrangedSubview(usernameEmailTextField)
        stackView.addArrangedSubview(passwordTextField)
        stackView.addArrangedSubview(loginButton)
        stackView.addArrangedSubview(createAccountButton)
        body.addSubview(stackView)
        body.addSubview(termsButton)
        body.addSubview(privacyButton)
        view.addSubview(body)

    }
    private func connectButtonToFunc() {
        loginButton.addTarget(self, action: #selector(loginButtonClicked), for: .touchUpInside)
        createAccountButton.addTarget(self, action: #selector(createAccountButtonClicked), for: .touchUpInside)
        termsButton.addTarget(self, action: #selector(termsButtonClicked), for: .touchUpInside)
        privacyButton.addTarget(self, action: #selector(privacyButtonClicked), for: .touchUpInside)

    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        _ = headerView.left
        _ = headerView.buttom

        configurHeaderAnchors()
        
        configurBodyAnchors()
    }
    private func configurHeaderAnchors() {
        headerView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        headerView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        headerView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        headerView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.35).isActive = true
        
        configurHeaderView()
    }
    
    private func configurHeaderView() {
        guard headerView.subviews.count == 1 else { return }
        
        configurHeaderImageViewAnchors()
        
        let instagram = UIImageView(image: #imageLiteral(resourceName: "Instagram"))
        instagram.contentMode = .scaleAspectFit
        instagram.translatesAutoresizingMaskIntoConstraints = false
        
        headerView.addSubview(instagram)
        
        configurHeaderInstagramText(instagram)
    }
    private func configurHeaderImageViewAnchors() {
        guard let imageView = headerView.subviews.first as? UIImageView else { return }
        
        imageView.rightAnchor.constraint(equalTo: headerView.rightAnchor).isActive = true
        imageView.leftAnchor.constraint(equalTo: headerView.leftAnchor).isActive = true
        imageView.bottomAnchor.constraint(equalTo: headerView.bottomAnchor).isActive = true
        imageView.topAnchor.constraint(equalTo: headerView.topAnchor).isActive = true
    }
    private func configurHeaderInstagramText(_ instagram: UIImageView) {
        instagram.topAnchor.constraint(equalTo: headerView.topAnchor, constant: 40).isActive = true
        instagram.bottomAnchor.constraint(equalTo: headerView.bottomAnchor, constant: -30).isActive = true
        instagram.leftAnchor.constraint(equalTo: headerView.leftAnchor, constant: 70).isActive = true
        instagram.rightAnchor.constraint(equalTo: headerView.rightAnchor, constant: -70).isActive = true
    }
    private func configurBodyAnchors() {
        body.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.65).isActive = true
        body.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        body.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        body.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        
        configurStackViewAnchors()
        
        configurBodyFooter()
    }
    private func configurStackViewAnchors() {
        stackView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 25).isActive = true
        stackView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -25).isActive = true
        stackView.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 20).isActive = true
        stackView.heightAnchor.constraint(equalTo: body.heightAnchor, multiplier: 0.55).isActive = true
    }
    private func configurBodyFooter() {
        termsButton.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 30).isActive = true
        termsButton.heightAnchor.constraint(equalTo: body.heightAnchor, multiplier: 0.1).isActive = true
        termsButton.centerXAnchor.constraint(equalTo: body.centerXAnchor).isActive = true
        termsButton.bottomAnchor.constraint(equalTo: body.bottomAnchor, constant: -55).isActive = true
        
        privacyButton.topAnchor.constraint(equalTo: termsButton.bottomAnchor, constant: 10).isActive = true
        privacyButton.heightAnchor.constraint(equalTo: body.heightAnchor, multiplier: 0.1).isActive = true
        privacyButton.centerXAnchor.constraint(equalTo: body.centerXAnchor).isActive = true
        privacyButton.bottomAnchor.constraint(equalTo: body.bottomAnchor, constant: -10).isActive = true
    }
    @objc private func loginButtonClicked() {
        guard let usernameEmail = usernameEmailTextField.text, !usernameEmail.isEmpty,
              let password = passwordTextField.text, !password.isEmpty, password.count >= 8 else {
            return
        }
        var username: String?, email: String?
        
        if usernameEmail.contains("@") && usernameEmail.contains(".") {
            email = usernameEmail
        } else {
            username = usernameEmail
        }
        AuthManager.shared.loginUser(username: username, email: email, password: password) { [weak self] success in
            if success {
                self?.dismiss(animated: true, completion: nil)
            }
            else {
                let alert = UIAlertController(title: "Login Error", message: "Unable to login", preferredStyle: .alert)
                let action = UIAlertAction(title: "OK", style: .default, handler: nil)
                alert.addAction(action)
                self?.show(alert, sender: self)
            }
        }
        
        
    }
    @objc private func createAccountButtonClicked() {
        let vc = RegistrationViewController()
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: false, completion: nil)
    }
    @objc private func privacyButtonClicked() {
        guard let url = URL(string: "https://help.instagram.com/519522125107875") else {
            return
        }
        let vc = SFSafariViewController(url: url)
        present(vc, animated: true, completion: nil)
    }
    @objc private func termsButtonClicked() {
        guard let url = URL(string: "https://help.instagram.com/581066165581870") else {
            return
        }
        let vc = SFSafariViewController(url: url)
        present(vc, animated: true, completion: nil)
    }
}



extension LoginViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == usernameEmailTextField {
            passwordTextField.becomeFirstResponder()
        }
        else {
            loginButtonClicked()
            textField.resignFirstResponder()
        }
        return true
    }
    
}
