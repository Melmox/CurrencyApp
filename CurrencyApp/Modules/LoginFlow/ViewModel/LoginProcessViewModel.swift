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
        if (password.count >= 6) {
            self.password = password
        } else {
            interfaceCoordinator?.presentPopUpController(with: "You password is too small")
        }
        if (self.email != nil && self.password != nil) {
            Firebase().logIn(email: email, password: password, onSuccess: {
                self.interfaceCoordinator?.state = .logined
                self.interfaceCoordinator?.start()
            }, onError: { (errorMessage) in
                print(errorMessage)
            })
        }
    }
}

