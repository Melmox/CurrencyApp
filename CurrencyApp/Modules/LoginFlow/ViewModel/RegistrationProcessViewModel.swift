//
//  RegistrationProcessViewModel.swift
//  CurrencyApp
//
//  Created by developer_tmp on 03.04.2023.
//

import Foundation

class RegistrationProcessViewModel: BasicControllerViewModel {
    
    // MARK: - Properties
    // MARK: Content
    
    private var name: String?
    private var email: String?
    private var password: String?
    private var profileImage: Data?
    private weak var coordinator: LoginCoordinator?
    private var service: UserServiceable?
    
    // MARK: - Initialization
    
    init(coordinator: LoginCoordinator, service: UserServiceable) {
        self.coordinator = coordinator
        self.service = service
    }
    
    // MARK: - Appearance
    
    func configure() {}
    
    // MARK: - Navigation
    
    func registrationButtonClick(user: User, password: String, confirmPassword: String) {
        if user.name.isValidName {
            name = user.name
            name = name?.trimmingCharacters(in: .whitespaces)
            name = name?.capitalized
        } else {
            coordinator?.presentPopUpController(with: "You inputed inappropriate name.", on: .error)
        }
        
        if user.email.isValidEmailAddress {
            email = user.email
            email = email?.lowercased()
        } else {
            coordinator?.presentPopUpController(with: "You inputed inappropriate email.", on: .error)
        }
        if (password.count < 6) {
            coordinator?.presentPopUpController(with: "Your passwords too short. It must be 6 charecters or longer.", on: .error)
        } else {
            if (password == confirmPassword) {
                self.password = password
            } else {
                coordinator?.presentPopUpController(with: "Your passwords are differend.", on: .error)
            }
        }
        if (name != nil && email != nil && self.password != nil) {
            service?.signIn(user: user, password: password, onSuccess: { user in
                self.service?.updateState(with: .logined)
                self.coordinator?.launchAppCoordinator()
            }, onError: { errorMessage in
                self.coordinator?.presentPopUpController(with: errorMessage, on: .error)
            })
        }
    }
}

