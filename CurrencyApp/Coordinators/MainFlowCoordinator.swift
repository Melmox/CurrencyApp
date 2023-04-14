//
//  MainFlowCoordinator.swift
//  CurrencyApp
//
//  Created by developer_tmp on 13.03.2023.
//

import UIKit

final class MainFlowCoordinator {
    
    // MARK: - Properties
    // MARK: Content
    
    private var currencyHistoryController: CurrencyHistoryCurrencyNameController?
    private var walletController: WalletController?
    
    private var parentCoordinator: AppCoordinator?
    
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
        parentCoordinator?.currentController = controller
    }
    
    func presentWalletSettingsController() {
        let controller = createWalletSettingsController()
        walletController?.navigationController?.pushViewController(controller, animated: true)
        parentCoordinator?.currentController = controller
    }
    
    func presentWebViewController() {
        let controller = createWebViewController()
        walletController?.navigationController?.pushViewController(controller, animated: true)
        parentCoordinator?.currentController = controller
    }
    
    func presentPopUpController(with message: String, on state: PopUpState) {
        parentCoordinator?.presentPopUpController(with: message, on: state)
    }
    
    func launchAppCoordinator() {
        parentCoordinator?.start()
    }
    
    func presentWalletDetailsController(with card: CreditCard) {
        let controller = createWalletDetailsController()
        controller.viewModel.selectedCard = card
        walletController?.navigationController?.pushViewController(controller, animated: true)
        parentCoordinator?.currentController = controller
    }
    
    func presentAddingCardController() {
        let controller = createAddingCardController()
        walletController?.present(controller, animated: true)
        parentCoordinator?.currentController = controller
    }
    
    // MARK: - Modules
    
    private func createTabBarController() -> UITabBarController {
        let tabBarController = TabBarController()
        let tabBarViews = [createWalletController(), createCurrencyHistoryController()]
        tabBarController.configureTabItems(with: tabBarViews)
        return tabBarController
    }
    
    private func createWalletController() -> UINavigationController {
        if let cardService = parentCoordinator?.getCardService(), let ratesService = parentCoordinator?.getRatesService()  {
            let walletController = WalletController(
                viewModel: WalletViewModel(coordinator: self, cardService: cardService, ratesService: ratesService))
            self.walletController = walletController
            return UINavigationController(rootViewController: walletController)
        }
        return UINavigationController(rootViewController: UIViewController())
    }
    
    private func createCurrencyHistoryController() -> UINavigationController {
        if let ratesService = parentCoordinator?.getRatesService()  {
            let currencyHistoryController = CurrencyHistoryCurrencyNameController(
                viewModel: CurrencyHistoryCurrencyNameViewModel(coordinator: self, ratesService: ratesService))
            self.currencyHistoryController = currencyHistoryController
            return UINavigationController(rootViewController: currencyHistoryController)
        }
        return UINavigationController(rootViewController: UIViewController())
    }
    
    private func createCurrencyHistoryInfoDetailsController() -> CurrencyHistoryInfoDetailsController {
        let currencyHistoryInfoDetails = CurrencyHistoryInfoDetailsController(
            viewModel: CurrencyHistoryInfoDetailsViewModel(coordinator: self)
        )
        return currencyHistoryInfoDetails
    }
    
    private func createWalletSettingsController() -> WalletSettingsController {
        if let service = parentCoordinator?.getUserService() {
            let walletSettingsController = WalletSettingsController(
                viewModel: WalletSettingsViewModel(coordinator: self, service: service))
            return walletSettingsController
        }
        return UIViewController() as! WalletSettingsController
    }
    
    private func createWebViewController() -> WalletSettingsWebViewController {
        let webViewController = WalletSettingsWebViewController()
        return webViewController
    }
    
    private func createWalletDetailsController() -> WalletDetailsController {
        if let cardService = parentCoordinator?.getCardService(), let ratesService = parentCoordinator?.getRatesService(){
            let walletDetailsController = WalletDetailsController(viewModel: WalletDetailsViewModel(coordinator: self, cardService: cardService, exchangeRateService: ratesService))
            return walletDetailsController
        }
        return UIViewController() as! WalletDetailsController
    }
    
    private func createAddingCardController() -> WalletAlertController {
        if let service = parentCoordinator?.getCardService(){
            let addingCardControoler = WalletAlertController(viewModel: WalletAlertViewModel(coordinator: self, cardService: service))
            return addingCardControoler
        }
        return UIAlertController() as! WalletAlertController
    }
}
