//
//  Coordinator.swift
//  CurrencyApp
//
//  Created by developer_tmp on 13.03.2023.
//

import UIKit

final class Coordinator {
    
    var window: UIWindow?
    
    // MARK: - Initialization
    
    init(window: UIWindow?) {
        self.window = window
    }
    
    // MARK: - Methods
    
    func start() {
        let tabBarController = createTabBarController()
        window?.rootViewController = tabBarController
        window?.makeKeyAndVisible()
    }
    
    // MARK: - Modules
    
    private func createTabBarController() -> UITabBarController {
        //        let viewModel = SomeViewModel(coordinator: self, service: SomeService)
        //        let controller = UIViewController(viewModel: viewModel)
        let tabBarController = TabBarController()
        let tabBarViews = [createWalletController(), createCurrencyHistoryController()]
        tabBarController.configureTabItems(with: tabBarViews)
        return tabBarController
    }
    
    private func createWalletController() -> UIViewController{
        let walletController = WalletController(
            viewModel: WalletViewModel(coordinator: self)
        )
        return walletController
    }
    
    private func createCurrencyHistoryController() -> UIViewController{
        let currencyHistoryController = CurrencyHistoryController()
        return currencyHistoryController
    }
    
}
