//
//  Firebase.swift
//  CurrencyApp
//
//  Created by developer_tmp on 03.04.2023.
//

import Foundation
import Firebase
import FirebaseAuth
import FirebaseDatabase
import FirebaseStorage

final class Firebase {
    
    // MARK: - Configure
    func configure() {
        FirebaseApp.configure()
    }
    
    // MARK: - Create account
    
    func createAccount(login: String, password: String, profileImage: UIImage? = nil) {
        print("Account created with login: \(login) and password: \(password)")
        Auth.auth().createUser(withEmail: login, password: password){ (authDataResult, error) in
            if error != nil {
                print(error!.localizedDescription)
                return
            }
            if let authData = authDataResult {
                print(authData.user.email)
            }
        }
    }
    
    // MARK: - Log in into account
    
    func logIn(login: String, password: String) {
        print("You just loginned into account: \(login)")
        Auth.auth().signIn(withEmail: login, password: password){ (authDataResult, error) in
            if error != nil {
                print(error!.localizedDescription)
                return
            }
            if let authData = authDataResult {
                print(authData)
            }
        }
    }
}
