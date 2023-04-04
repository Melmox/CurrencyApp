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
    func registrationButtonClick(user: User, confirmPassword: String) {
        if user.name.isValidName {
            name = user.name
            name = name?.trimmingCharacters(in: .whitespaces)
            name = name?.capitalized
        } else {
            
            //alert message about inapropriate name
        }
        
        if user.email.isValidEmailAddress {
            email = user.email
            email = email?.lowercased()
        } else {
            //alert message about inapropriate email
        }
        if (user.password == confirmPassword) {
            password = user.password
        } else {
            //alert message about differend passwords or small lenth of password
        }
        if (name != nil && email != nil && password != nil) {
            Firebase().createAccount(user: user, onSuccess: {
                self.interfaceCoordinator?.state = .logined
                self.interfaceCoordinator?.start()
            }, onError: { (errorMessage) in
                print(errorMessage)
            })
        }
    }
}
