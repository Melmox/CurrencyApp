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
    
    private weak var interfaceCoordinator: LoginCoordinator?

    
    //MARK: Callbacks
    
        
    
    //MARK: - Init
    
    init(coordinator: LoginCoordinator) {
        interfaceCoordinator = coordinator
    }
    
    //MARK: - Appearance
    
    func configure() {
        // MARK: - DownloadData

    }
    
    //MARK: - Provider
    
    
    //MARK: - Navigation
    
    func coordinateLoginPage() {
        interfaceCoordinator?.presentLoginController()
    }
    func coordinateRegistrationPage() {
        interfaceCoordinator?.presentRegistrationController()
    }
}
