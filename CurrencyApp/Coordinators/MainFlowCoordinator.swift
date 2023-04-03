//
//  MainFlowCoordinator.swift
//  CurrencyApp
//
//  Created by developer_tmp on 13.03.2023.
//

import UIKit

final class MainFlowCoordinator {
    
    var currencyHistoryController: CurrencyHistoryCurrencyNameController?
    var parentCoordinator: AppCoordinator?
    
    // MARK: - Initialization
    
    init(parentCoordinator: AppCoordinator?) {
        self.parentCoordinator = parentCoordinator
    }
    
    
    // MARK: - Methods
    func start() {
        let tabBarController = createTabBarController()
        parentCoordinator?.window?.rootViewController = tabBarController
        parentCoordinator?.window?.makeKeyAndVisible()
    }
    
    func presentCurrencyHistoryInfoDetailsController(title: String, data: ExchangeRatesDateRange? = nil, previousMonthData: ExchangeRatesDateRange? = nil) {
        let controller = createCurrencyHistoryInfoDetailsController()
        controller.navigationItem.title = title
        controller.viewModel.exchangeCureencyRates = data
        controller.viewModel.previousMonthExchangeCureencyRates = previousMonthData
        controller.viewModel.selectedCurrency = title
        currencyHistoryController?.navigationController?.pushViewController(controller, animated: true)
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
    
    private func createWalletController() -> WalletController {
        let walletController = WalletController(
            viewModel: WalletViewModel(coordinator: self)
        )
        return walletController
    }
    
    private func createCurrencyHistoryController() -> UINavigationController {
        let currencyHistoryController = CurrencyHistoryCurrencyNameController(viewModel: CurrencyHistoryCurrencyNameViewModel(coordinator: self))
        self.currencyHistoryController = currencyHistoryController
        return UINavigationController(rootViewController: currencyHistoryController)
    }
    
    private func createCurrencyHistoryInfoDetailsController() -> CurrencyHistoryInfoDetailsController {
        let currencyHistoryInfoDetails = CurrencyHistoryInfoDetailsController(
            viewModel: CurrencyHistoryInfoDetailsViewModel(coordinator: self)
        )
        return currencyHistoryInfoDetails
    }
}