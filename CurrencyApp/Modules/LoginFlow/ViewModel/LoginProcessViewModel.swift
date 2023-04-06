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
    
    private weak var coordinator: LoginCoordinator?
    private weak var service: UserService?
    
    //MARK: Callbacks
    
    
    
    //MARK: - Init
    
    init(service: UserService, coordinator: LoginCoordinator) {
        self.service = service
        self.coordinator = coordinator
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
            coordinator?.presentPopUpController(with: "You used incorrect format of email.")
        }
        if password.count < 6 {
            coordinator?.presentPopUpController(with: "Your password is too short.")
        } else {
            self.password = password
        }
        if (self.email != nil && self.password != nil) {
            service?.logIn(email: email, password: password, onSuccess: {  (user) in
                self.service?.state = .logined
                self.coordinator?.launchAppCoordinator()
            }, onError: { (errorMessage) in
                self.coordinator?.presentPopUpController(with: errorMessage)
            })
        }
    }
}

