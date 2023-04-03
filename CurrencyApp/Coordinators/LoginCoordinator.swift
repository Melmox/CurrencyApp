//
//  LoginCoordinator.swift
//  CurrencyApp
//
//  Created by developer_tmp on 27.03.2023.
//

import UIKit

final class LoginCoordinator {
    var loginLaunchScreenController: UINavigationController?
    var parentCoordinator: AppCoordinator?

    
    // MARK: - Initialization
    
    init(parentCoordinator: AppCoordinator?) {
        self.parentCoordinator = parentCoordinator
    }
    
    // MARK: - Methods
    func start() {
        loginLaunchScreenController = createLoginLaunchScreenController()
        parentCoordinator?.window?.rootViewController = loginLaunchScreenController
        parentCoordinator?.window?.makeKeyAndVisible()
    }
    
    func presentLoginController() {
        let controller = createLoginProcessController()
        loginLaunchScreenController?.pushViewController(controller, animated: true)
    }
    func presentRegistrationController() {
        let controller = createRegistrationProcessController()
        loginLaunchScreenController?.pushViewController(controller, animated: true)
    }
    
    // MARK: - Modules
    
    private func createLoginLaunchScreenController() -> UINavigationController{
        let loginLaunchScreenController = LoginLaunchScreen(viewModel: LoginLaunchViewModel(coordinator: self))
        return UINavigationController(rootViewController: loginLaunchScreenController)
    }
    
    private func createLoginProcessController() -> UIViewController{
        if let coordinator = parentCoordinator {
            let loginProcessController = LoginProcessScreen(viewModel: LoginProcessViewModel(coordinator: coordinator))
            return loginProcessController
        }
        return UIViewController()
    }
    
    private func createRegistrationProcessController() -> UIViewController{
        if let coordinator = parentCoordinator {
            let registrationProcessController = RegistrationProcessScreen(viewModel: RegistrationProcessViewModel(coordinator: coordinator))
            return registrationProcessController
        }
        return UIViewController()
    }
}
