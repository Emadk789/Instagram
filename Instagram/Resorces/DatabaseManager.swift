//
//  DatabaseManager.swift
//  Instagram
//
//  Created by Emad Albarnawi on 15/01/2021.
//

import Foundation
import FirebaseDatabase

class DatabaseManager {
    static let shared = DatabaseManager()
    
    private let database = Database.database().reference()
    
    private init() {}
    
    public func canCreateNewUser(with email: String, username: String, compleation: (Bool) -> Void ) {
        compleation(true)
    }
    
    public func insertNewUser(with email: String, username: String, completion: @escaping (Bool) -> Void) {
        database.child(email.safeKey()).setValue(["username": username]) { (error, ref) in
            guard error == nil else {
                completion(false)
                return
                
            }
            completion(true)
        }
    }

    
}
