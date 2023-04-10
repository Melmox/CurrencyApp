//
//  LoginCoordinator.swift
//  CurrencyApp
//
//  Created by developer_tmp on 27.03.2023.
//

import UIKit

final class LoginCoordinator {
    
    // MARK: - Properties

    private var loginLaunchScreenController: UINavigationController?
    private var parentCoordinator: AppCoordinator?
    
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
    
    func presentPopUpController(with message: String) {
        parentCoordinator?.presentPopUpController(with: message)
    }
    
    func launchAppCoordinator() {
        parentCoordinator?.start()
    }
    
    // MARK: - Modules
    
    private func createLoginLaunchScreenController() -> UINavigationController{
        let loginLaunchScreenController = LoginLaunchController(viewModel: LoginLaunchViewModel(coordinator: self))
        return UINavigationController(rootViewController: loginLaunchScreenController)
    }
    
    private func createLoginProcessController() -> UIViewController{
        if let service = parentCoordinator?.getUserService() {
            let loginProcessController = LoginProcessController(viewModel: LoginProcessViewModel(coordinator: self, service: service))
            return loginProcessController
        }
        return UIViewController()
    }
    
    private func createRegistrationProcessController() -> UIViewController{
        if let service = parentCoordinator?.getUserService() {
            let registrationProcessController = RegistrationProcessController(viewModel: RegistrationProcessViewModel(coordinator: self, service: service))
            return registrationProcessController
        }
        return UIViewController()
    }
}
