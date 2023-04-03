//
//  LoginProcessViewModel.swift
//  CurrencyApp
//
//  Created by developer_tmp on 03.04.2023.
//

import Foundation

class LoginProcessViewModel: BasicControllerViewModel {
    //MARK: - Properties


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
    
    func coordinateMainFlow() {
        interfaceCoordinator?.launchMainFlowCoordinator()
    }
}
