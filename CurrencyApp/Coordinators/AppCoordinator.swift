//
//  AppCoordinator.swift
//  CurrencyApp
//
//  Created by developer_tmp on 03.04.2023.
//

import UIKit

class AppCoordinator {
    
    // MARK: - Properties

    var window: UIWindow?
    var loginCoordinator: LoginCoordinator?
    var mainCoordinator: MainFlowCoordinator?
    
    var popUpController: PopUpViewController?
    var currentController: UIViewController?
    
    // MARK: - Services

    private let userService = UserService()
    
    // MARK: - Initialization
    
    init(window: UIWindow?) {
        self.window = window
    }
    
    // MARK: - Methods

    func start() {
        switch userService.state {
        case .notLogined:
            launchLoginCoordinator()
        case .logined:
            launchMainFlowCoordinator()
        case .none:
            launchLoginCoordinator()
        }
    }
    
    func presentPopUpController(with text: String) {
        if currentController != popUpController {
            let controller = createPopUpController()
            controller.viewModel.alertLabelText = text
            controller.modalPresentationStyle = .overCurrentContext
            controller.modalTransitionStyle = .crossDissolve
            if let currentController = currentController {
                currentController.present(controller, animated: true)
                popUpController = controller
                self.currentController = controller
            }
        }
    }
    
    func dismisPopUpController() {
        if let currentController = currentController {
            currentController.dismiss(animated: true, completion:nil)
            popUpController = nil
            let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene
            self.currentController = windowScene?.windows.first?.rootViewController
        }
    }
    
    func getUserService() -> UserService {
        userService
    }
    
    // MARK: - Modules
    
    private func launchLoginCoordinator() {
        loginCoordinator = LoginCoordinator(parentCoordinator: self)
        loginCoordinator?.start()
        dismissMainFlowCoordinator()
    }
    
    private func launchMainFlowCoordinator() {
        mainCoordinator = MainFlowCoordinator(parentCoordinator: self)
        mainCoordinator?.start()
        dismissLoginCoordinator()
    }
    
    private func dismissLoginCoordinator() {
        loginCoordinator = nil
    }
    
    private func dismissMainFlowCoordinator() {
        mainCoordinator = nil
    }
    
    private func createPopUpController() -> PopUpViewController {
        let popUpCoontroller = PopUpViewController(viewModel: PopUpViewModel(appCoordinator: self))
        return popUpCoontroller
    }
}
