//
//  User.swift
//  CurrencyApp
//
//  Created by developer_tmp on 04.04.2023.
//

import Foundation

struct User {
    let name: String
    let email: String
    let password: String
    let profilePhoto: Data?
    
    init(name: String, email: String, password: String, profilePhoto: Data?) {
        self.name = name
        self.email = email
        self.password = String(password.hashValue)
        self.profilePhoto = profilePhoto
    }
    
    
}
