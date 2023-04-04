//
//  LoginCoordinator.swift
//  CurrencyApp
//
//  Created by developer_tmp on 27.03.2023.
//

import UIKit

final class LoginCoordinator {
    private var loginLaunchScreenController: UINavigationController?
    private var parentCoordinator: AppCoordinator?
    //    var currentController: UIViewController?
    
    
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
        if let coordinator = parentCoordinator {
            coordinator.currentController = controller
        }
    }
    func presentRegistrationController() {
        let controller = createRegistrationProcessController()
        loginLaunchScreenController?.pushViewController(controller, animated: true)
        if let coordinator = parentCoordinator {
            coordinator.currentController = controller
        }
    }
    
    // MARK: - Modules
    
    private func createLoginLaunchScreenController() -> UINavigationController{
        if let coordinator = parentCoordinator {
            let loginLaunchScreenController = LoginLaunchController(viewModel: LoginLaunchViewModel(appCoordinator: coordinator))
            return UINavigationController(rootViewController: loginLaunchScreenController)
        }
        return UINavigationController()
    }
    
    private func createLoginProcessController() -> UIViewController{
        if let coordinator = parentCoordinator {
            let loginProcessController = LoginProcessController(viewModel: LoginProcessViewModel(coordinator: coordinator))
            return loginProcessController
        }
        return UIViewController()
    }
    
    private func createRegistrationProcessController() -> UIViewController{
        if let coordinator = parentCoordinator {
            let registrationProcessController = RegistrationProcessController(viewModel: RegistrationProcessViewModel(coordinator: coordinator))
            return registrationProcessController
        }
        return UIViewController()
    }
}
