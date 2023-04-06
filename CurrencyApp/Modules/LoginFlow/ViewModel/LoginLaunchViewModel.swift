//
//  LoginLaunchViewModel.swift
//  CurrencyApp
//
//  Created by developer_tmp on 03.04.2023.
//

import Foundation

class LoginLaunchViewModel: BasicControllerViewModel {
    //MARK: - Properties


    //MARK: Content
    
    private weak var coordinator: LoginCoordinator?


    
    //MARK: Callbacks
    
        
    
    //MARK: - Init
    
    init(coordinator: LoginCoordinator) {
        self.coordinator = coordinator
    }
    
    //MARK: - Appearance
    
    func configure() {
        // MARK: - DownloadData

    }
    
    //MARK: - Provider
    
    
    //MARK: - Navigation
    
    func coordinateLoginPage() {
        coordinator?.presentLoginController()
    }
    func coordinateRegistrationPage() {
//        print("CHANGE IT LATER")
//        self.coordinator?.updateSignInState(with: .logined)
//        coordinator?.launchAppCoordinator()
        coordinator?.presentRegistrationController()
    }
}
