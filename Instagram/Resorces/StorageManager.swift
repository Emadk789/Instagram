//
//  StorageManager.swift
//  Instagram
//
//  Created by Emad Albarnawi on 15/01/2021.
//

import Foundation
import FirebaseStorage


class StorageManager {
    static let shared = StorageManager()
    
    private let bucket = Storage.storage().reference()
    private init() {}
    
    enum IGStoregManagerError: Error {
        case faildToDownload
    }
    
    func uploadUserPost(model: UserPost, completion: @escaping (Result<URL, Error>) -> Void) {
        
    }
    func downloadImage(with reference: String, completion: @escaping (Result<URL, IGStoregManagerError>) -> Void) {
        bucket.child(reference).downloadURL { (url, error) in
            guard url != nil, error == nil else {
                completion(.failure(.faildToDownload))
                return
            }
            
            completion(.success(url!))
        }
    }
}

enum UserPostType {
    case photo, video
}
struct UserPost {
    let postType: UserPostType
}
