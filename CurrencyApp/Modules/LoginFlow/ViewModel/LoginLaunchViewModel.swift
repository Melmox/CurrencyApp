//
//  LoginLaunchViewModel.swift
//  CurrencyApp
//
//  Created by developer_tmp on 03.04.2023.
//

import Foundation

class LoginLaunchViewModel: BasicControllerViewModel {
    
    // MARK: - Properties
    // MARK: Content
    
    private weak var coordinator: LoginCoordinator?
        
    // MARK: - Initialization
    
    init(coordinator: LoginCoordinator) {
        self.coordinator = coordinator
    }
    
    // MARK: - Appearance
    
    func configure() {}
    
    // MARK: - Navigation
    
    func coordinateLoginPage() {
        coordinator?.presentLoginController()
    }
    
    func coordinateRegistrationPage() {
        coordinator?.presentRegistrationController()
    }
}
