//
//  LoginProcessViewModel.swift
//  CurrencyApp
//
//  Created by developer_tmp on 03.04.2023.
//

import Foundation

class LoginProcessViewModel: BasicControllerViewModel {
    //MARK: - Properties
    
    private var email: String?
    private var password: String?
    
    //MARK: Content
    
    private weak var interfaceCoordinator: AppCoordinator?
    
    
    //MARK: Callbacks
    
    
    
    //MARK: - Init
    
    init(coordinator: AppCoordinator) {
        interfaceCoordinator = coordinator
    }
    
    //MARK: - Appearance
    
    func configure() {
        
    }
    
    //MARK: - Provider
    
    
    //MARK: - Navigation
    
    func loginButtonClick(email: String, password: String) {
        if email.isValidEmailAddress {
            self.email = email
            self.email = self.email?.lowercased()
        } else {
            interfaceCoordinator?.presentPopUpController(with: "You used incorrect format of email")
        }
        self.password = password
        if (self.email != nil && self.password != nil) {
            Firebase().logIn(email: email, password: password, onSuccess: { (authDataResult) in
                self.interfaceCoordinator?.state = .logined
                if let name = authDataResult.user.displayName, let email = authDataResult.user.email, let profilePhoto = authDataResult.user.photoURL {
                    self.interfaceCoordinator?.currentUser = User(name: name,
                                                                  email: email,
                                                                  profilePhotoURL: profilePhoto)
                }
                self.interfaceCoordinator?.start()
            }, onError: { (errorMessage) in
                self.interfaceCoordinator?.presentPopUpController(with: errorMessage)
            })
        }
    }
}

