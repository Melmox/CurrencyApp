//
//  LoginCoordinator.swift
//  CurrencyApp
//
//  Created by developer_tmp on 27.03.2023.
//

import UIKit

final class loginCoordinator {
    var window: UIWindow?
    
    // MARK: - Initialization
    
    init(window: UIWindow?) {
        self.window = window
    }
    
    // MARK: - Methods
    func start() {
        let lauchController = createLoginLaunchScreenController()
//        let lauchController = createLoginProcessController()
//        let lauchController = createRegistrationProcessController()
        window?.rootViewController = lauchController
        window?.makeKeyAndVisible()
    }
    
    // MARK: - Modules
    
    private func createLoginLaunchScreenController() -> UINavigationController{
        let loginLaunchScreenController = LoginLaunchScreen()
        return loginLaunchScreenController
    }
    
    private func createLoginProcessController() -> UIViewController{
        let loginProcessController = LoginProcessScreen()
        return loginProcessController
    }
    
    private func createRegistrationProcessController() -> UIViewController{
        let registrationProcessController = RegistrationProcessScreen()
        return registrationProcessController
    }
}
