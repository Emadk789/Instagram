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
        button.setTitle("Terms of Serviece", for: .normal)
        button.setTitleColor(.secondaryLabel, for: .normal)
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
        button.setTitle("Pricacy Policy", for: .normal)
        button.setTitleColor(.secondaryLabel, for: .normal)
        return button
    }()
    private let headerView: UIView = {
        let view = UIView()
        view.clipsToBounds = true
        view.backgroundColor = .systemPink
        let backgroundImageView = UIImageView()
        backgroundImageView.image = #imageLiteral(resourceName: "instagram-gradient")
        view.addSubview(backgroundImageView)
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
        usernameEmailTextField.delegate = self
        passwordTextField.delegate = self
        addSubViews()
        connectButtonToFunc()
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
//        _ = headerView.left
//        _ = headerView.left
        headerView.frame = CGRect(
            x: 0,
            y: view.top,
            width: view.width,
            height: view.height/3)
        usernameEmailTextField.frame = CGRect(
            x: 25,
            y: headerView.buttom + 20,
            width: view.width - 50,
            height: 50)
        passwordTextField.frame = CGRect(
            x: 25,
            y: usernameEmailTextField.buttom + 10,
            width: view.width - 50,
            height: 50)
        loginButton.frame = CGRect(
            x: 25,
            y: passwordTextField.buttom + 10,
            width: view.width - 50,
            height: 50)
        createAccountButton.frame = CGRect(
            x: 25,
            y: loginButton.buttom + 10,
            width: view.width - 50,
            height: 50)
        termsButton.frame = CGRect(
            x: view.width/4,
            y: view.height - view.safeAreaInsets.bottom - 50,
            width: view.width/2,
            height: 10)
        privacyButton.frame = CGRect(
            x: view.width/4,
            y: view.height - view.safeAreaInsets.bottom - 20,
            width: view.width/2,
            height: 10)
        configurHeaderView()
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
    private func configurHeaderView() {
        guard headerView.subviews.count == 1 else { return }
        guard let imageView = headerView.subviews.first as? UIImageView else { return }
        imageView.frame = headerView.frame
        
        let instagram = UIImageView()
        instagram.image = #imageLiteral(resourceName: "Instagram")
        instagram.contentMode = .scaleAspectFit
        instagram.frame = CGRect(x: imageView.bounds.width/4, y: view.safeAreaInsets.top, width: imageView.bounds.width/2, height: imageView.bounds.height - 20)
        headerView.addSubview(instagram)
    }
    @objc private func loginButtonClicked() {
        guard let usernameEmail = usernameEmailTextField.text, !usernameEmail.isEmpty,
              let password = passwordTextField.text, !password.isEmpty, password.count >= 8 else {
            return
        }
        
    }
    @objc private func createAccountButtonClicked() {
        let vc = RegistrationViewController()
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true, completion: nil)
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
        
//        isFirstResponder = textField.next
        return true
    }
    
}
