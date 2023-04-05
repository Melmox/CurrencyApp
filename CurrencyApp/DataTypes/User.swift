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
    let profilePhoto: Data?
    let profilePhotoURL: URL?
    
    init(name: String, email: String, profilePhoto: Data? = nil, profilePhotoURL: URL? = nil) {
        self.name = name
        self.email = email
        self.profilePhoto = profilePhoto
        self.profilePhotoURL = profilePhotoURL
    }
}
