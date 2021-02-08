//
//  HomeViewController.swift
//  Instagram
//
//  Created by Emad Albarnawi on 13/01/2021.
//

import UIKit
import FirebaseAuth

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        tabBarController?.tabBar.tintColor = UIColor.label
        // Do any additional setup after loading the view.
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        handelNotAuthenticated()
    }
    
    private func handelNotAuthenticated() {
        // Check auth status
        print("Current User", Auth.auth().currentUser, "----------------------")
        if Auth.auth().currentUser == nil {
            // Show login
            let loginViewContoller = LoginViewController()
            loginViewContoller.modalPresentationStyle = .fullScreen
            present(loginViewContoller, animated: false, completion: nil)
            
        }
    }
}
