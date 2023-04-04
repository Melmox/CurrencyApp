//
//  AppCoordinator.swift
//  CurrencyApp
//
//  Created by developer_tmp on 03.04.2023.
//

import UIKit

enum AppState {
    case notLogined, logined
}

class AppCoordinator {
    var window: UIWindow?
    var loginCoordinator: LoginCoordinator?
    var mainCoordinator: MainFlowCoordinator?
    
//    private var popUpController: PopUpViewController?
    var currentController: UIViewController?
    
    var state = AppState.notLogined
    
    // MARK: - Initialization
    
    init(window: UIWindow?) {
        self.window = window
    }
    
    func start() {
        switch state {
        case .notLogined:
            launchLoginCoordinator()
        case .logined:
            launchMainFlowCoordinator()
        }
//        popUpController = createPopUpController()
    }
    
    private func launchLoginCoordinator() {
        loginCoordinator = LoginCoordinator(parentCoordinator: self)
        loginCoordinator?.start()
    }
    
    private func launchMainFlowCoordinator() {
        mainCoordinator = MainFlowCoordinator(parentCoordinator: self)
        mainCoordinator?.start()
    }
    
    private func dismisLoginCoordinator() {
        loginCoordinator = nil
        self.start()
    }
    
    private func dismisMainFlowCoordinator() {
        mainCoordinator = nil
        self.start()
    }
    
    private func createPopUpController() -> PopUpViewController {
        let popUpCoontroller = PopUpViewController(viewModel: PopUpViewModel(appCoordinator: self))
        return popUpCoontroller
    }
    
    func presentPopUpController(with text: String) {
        let controller = createPopUpController()
        controller.viewModel.alertLabelText = text
        if let currentController = currentController {
            controller.modalPresentationStyle = .overCurrentContext
            controller.modalTransitionStyle = .crossDissolve
            currentController.present(controller, animated: true)
            self.currentController = controller
        }
    }
}
