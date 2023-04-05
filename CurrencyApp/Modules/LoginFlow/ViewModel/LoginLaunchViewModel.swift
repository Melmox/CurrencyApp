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
    
    private weak var appCoordinator: AppCoordinator?


    
    //MARK: Callbacks
    
        
    
    //MARK: - Init
    
    init(appCoordinator: AppCoordinator) {
        self.appCoordinator = appCoordinator
    }
    
    //MARK: - Appearance
    
    func configure() {
        // MARK: - DownloadData

    }
    
    //MARK: - Provider
    
    
    //MARK: - Navigation
    
    func coordinateLoginPage() {
        appCoordinator?.loginCoordinator?.presentLoginController()
    }
    func coordinateRegistrationPage() {
        print("CHANGE IT LATER")
        appCoordinator?.state = .logined
        appCoordinator?.start()
//        appCoordinator?.loginCoordinator?.presentRegistrationController()
    }
}
