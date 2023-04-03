//
//  AppCoordinator.swift
//  CurrencyApp
//
//  Created by developer_tmp on 03.04.2023.
//

import UIKit

class AppCoordinator {
    var window: UIWindow?
    var loginCoordinator: LoginCoordinator?
    var mainCoordinator: MainFlowCoordinator?
    
    
    let tempState = 0
    
    
    // MARK: - Initialization
    
    init(window: UIWindow?) {
        self.window = window
    }
    
    func start() {
        switch tempState {
        case 0:
            launchLoginCoordinator()
        case 1:
            launchMainFlowCoordinator()
        default:
            print("error")
        }
    }
    
    func launchLoginCoordinator() {
        loginCoordinator = LoginCoordinator(parentCoordinator: self)
        loginCoordinator?.start()
    }
    
    func launchMainFlowCoordinator() {
        mainCoordinator = MainFlowCoordinator(parentCoordinator: self)
        mainCoordinator?.start()
    }
    
    func dismisLoginCoordinator() {
        loginCoordinator = nil
        self.start()
    }
    
    func dismisMainFlowCoordinator() {
        mainCoordinator = nil
        self.start()
    }
}
