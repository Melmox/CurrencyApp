//
//  RegistrationProcessViewModel.swift
//  CurrencyApp
//
//  Created by developer_tmp on 03.04.2023.
//

import Foundation

class RegistrationProcessViewModel: BasicControllerViewModel {
    
    //MARK: - Properties
        
    private var name: String?
    private var email: String?
    private var password: String?
    private var profileImage: Data?
    
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
    
//    func registrationButtonClick(name: String, email: String, password: String, confirmPassword: String, profileImage: Data? = nil) {
    func registrationButtonClick(user: User, password: String, confirmPassword: String) {
        if user.name.isValidName {
            name = user.name
            name = name?.trimmingCharacters(in: .whitespaces)
            name = name?.capitalized
        } else {
            interfaceCoordinator?.presentPopUpController(with: "You inputed inappropriate name.")
        }
        
        if user.email.isValidEmailAddress {
            email = user.email
            email = email?.lowercased()
        } else {
            interfaceCoordinator?.presentPopUpController(with: "You inputed inappropriate email.")
        }
        if (password.count < 6) {
            interfaceCoordinator?.presentPopUpController(with: "Your passwords too short. It must be 6 charecters or longer.")
        } else {
            if (password == confirmPassword) {
                self.password = password
            } else {
                interfaceCoordinator?.presentPopUpController(with: "Your passwords are differend.")
            }
        }
        if (name != nil && email != nil && self.password != nil) {
            Firebase().createAccount(user: user, password: password, onSuccess: {
                self.interfaceCoordinator?.state = .logined
                self.interfaceCoordinator?.currentUser = user
                self.interfaceCoordinator?.start()
            }, onError: { (errorMessage) in
                self.interfaceCoordinator?.presentPopUpController(with: errorMessage)
            })
        }
    }
}
