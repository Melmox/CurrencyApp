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
    var currentController: UIViewController?
    
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
    
    func presentWalletSettingsController() {
        let controller = createWalletSettingsController()
        walletController?.navigationController?.pushViewController(controller, animated: true)
    }
    
    func presentWebViewController() {
        let controller = createWebViewController()
        walletController?.navigationController?.pushViewController(controller, animated: true)
    }
    
    func presentPopUpController(with message: String) {
        parentCoordinator?.presentPopUpController(with: message)
    }
    
    func launchAppCoordinator() {
        parentCoordinator?.start()
    }
    
    func presentWalletDetailsController(with cardInfo: WalletCollectionViewCellViewModel) {
        let controller = createWalletDetailsController()
        controller.viewModel.cardInfoViewModel = cardInfo
        walletController?.navigationController?.pushViewController(controller, animated: true)
    }
    
    func presentAddingCardController() {
        let controller = createAddingCardController()
        walletController?.present(controller, animated: true)
    }
    
    // MARK: - Modules
    
    private func createTabBarController() -> UITabBarController {
        let tabBarController = TabBarController()
        let tabBarViews = [createWalletController(), createCurrencyHistoryController()]
        tabBarController.configureTabItems(with: tabBarViews)
        return tabBarController
    }
    
    private func createWalletController() -> UINavigationController {
        if let service = parentCoordinator?.getCardService() {
            let walletController = WalletController(
                viewModel: WalletViewModel(coordinator: self, cardService: service))
            self.walletController = walletController
            return UINavigationController(rootViewController: walletController)
        }
        return UINavigationController(rootViewController: UIViewController())
    }
    
    private func createCurrencyHistoryController() -> UINavigationController {
        let currencyHistoryController = CurrencyHistoryCurrencyNameController(
            viewModel: CurrencyHistoryCurrencyNameViewModel(coordinator: self))
        self.currencyHistoryController = currencyHistoryController
        return UINavigationController(rootViewController: currencyHistoryController)
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
        if let service = parentCoordinator?.getCardService(){
            let walletDetailsController = WalletDetailsController(viewModel: WalletDetailsViewModel(coordinator: self, cardService: service))
            return walletDetailsController
        }
        return UIViewController() as! WalletDetailsController
    }
    
    private func createAddingCardController() -> UIAlertController {
        let alertView = UIAlertController(
            title: "Select item from list",
            message: "\n\n\n\n\n\n\n\n\n",
            preferredStyle: .alert)

        let pickerView = UIPickerView(frame:
            CGRect(x: 0, y: 50, width: 260, height: 162))
//        pickerView.dataSource = self
//        pickerView.delegate = self

        // comment this line to use white color
        pickerView.backgroundColor = UIColor.lightGray.withAlphaComponent(0.2)

        alertView.view.addSubview(pickerView)

        let action = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)

        alertView.addAction(action)
//        present(alertView, animated: true, completion: { _ in
//            pickerView.frame.size.width = alertView.view.frame.size.width
//        })
        return alertView
    }
}
