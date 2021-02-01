//
//  AuthManager.swift
//  Instagram
//
//  Created by Emad Albarnawi on 15/01/2021.
//

import Foundation
import FirebaseAuth

class AuthManager {
    static let shared = AuthManager()
    
    private init() {}
    
    func registerNewUser(username: String, email: String, password: String) {
        
        DatabaseManager.shared.canCreateNewUser(with: email, username: username) { (canCreate) in
            
            if canCreate {
                Auth.auth().createUser(withEmail: email, password: password) { result, error in
                    
                    guard error != nil, result != nil else {
                        return
                    }
                    
                }
            }
        }
    }
    func loginUser(username: String?, email: String?, password: String, completion: @escaping ((Bool) -> Void)) {
        if let email = email {
            
            Auth.auth().signIn(withEmail: email, password: password) { (authResult, error) in
                
                guard authResult != nil, error == nil else {
                    completion(false)
                    return
                }
                
                completion(true)
            }
        }
        else {
//            Auth.auth().signinwith
//            Auth.auth().signIn(withEmail: email, password: password) { (authResult, error) in
//                
//                guard authResult != nil, error == nil else {
//                    completion(false)
//                    return
//                }
//                
//                completion(true)
//            }
        }
    }
    
}





