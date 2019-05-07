//
//  UserService.swift
//  TinderFirestore
//
//  Created by Frank Ferreira on 06/05/19.
//  Copyright © 2019 Frank Ferreira. All rights reserved.
//

import Foundation
import Firebase

class UserService {
    
    static let shared = UserService()
    
    func fetchCurrentUser(completion: @escaping (Result<User,Error>) -> ()) {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        Firestore.firestore().collection("users").document(uid).getDocument { (snapshot, error) in
            if let err = error {
                completion(.failure(err))
                return
            }
            
            // fetched our user here
            guard let dictionary = snapshot?.data() else { return }
            let user = User(dictionary: dictionary)
            completion(.success(user))
        }
    }
}
