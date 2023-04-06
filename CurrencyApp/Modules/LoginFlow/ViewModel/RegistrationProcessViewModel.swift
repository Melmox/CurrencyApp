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
    
    private weak var coordinator: LoginCoordinator?
    private weak var service: UserService?
    
    
    //MARK: Callbacks
    
    
    
    //MARK: - Init
    
    init(coordinator: LoginCoordinator, service: UserService) {
        self.coordinator = coordinator
        self.service = service
    }
    
    //MARK: - Appearance
    
    func configure() {
        
    }
    
    //MARK: - Provider
        
    
    //MARK: - Navigation
    
    func registrationButtonClick(user: User, password: String, confirmPassword: String) {
        if user.name.isValidName {
            name = user.name
            name = name?.trimmingCharacters(in: .whitespaces)
            name = name?.capitalized
        } else {
            coordinator?.presentPopUpController(with: "You inputed inappropriate name.")
        }
        
        if user.email.isValidEmailAddress {
            email = user.email
            email = email?.lowercased()
        } else {
            coordinator?.presentPopUpController(with: "You inputed inappropriate email.")
        }
        if (password.count < 6) {
            coordinator?.presentPopUpController(with: "Your passwords too short. It must be 6 charecters or longer.")
        } else {
            if (password == confirmPassword) {
                self.password = password
            } else {
                coordinator?.presentPopUpController(with: "Your passwords are differend.")
            }
        }
        if (name != nil && email != nil && self.password != nil) {
            service?.signIn(user: user, password: password, onSuccess: { user in
                self.service?.state = .logined
                self.coordinator?.launchAppCoordinator()
            }, onError: { errorMessage in
                self.coordinator?.presentPopUpController(with: errorMessage)
            })
        }
    }
}

