//
//  Coordinator.swift
//  CurrencyApp
//
//  Created by developer_tmp on 13.03.2023.
//

import UIKit

final class Coordinator {
    
    var window: UIWindow?
    
    var currencyHistoryController: CurrencyHistoryCurrencyNameController?
    
    
    // MARK: - Initialization
    
    init(window: UIWindow?) {
        self.window = window
    }
    
    
    // MARK: - Methods
    func start() {
        let tabBarController = createTabBarController()
        window?.rootViewController = tabBarController
        window?.makeKeyAndVisible()
        
//
//        var currentDate = Date()
//        print(currentDate)
//        print(currentDate.numberOfWeekInMonth)
////
//        var calendar = Calendar.current
//        calendar.locale = Locale(identifier: "uk")
//
//        var weekOfMonth = calendar.component(.weekOfMonth, from: currentDate)
//        print(weekOfMonth)
////
//        currentDate = calendar.date(byAdding: .day, value: 3, to: currentDate)!
//        print(currentDate.numberOfWeekInMonth)

//        weekOfMonth = calendar.component(.weekOfMonth, from: currentDate)
//        print(weekOfMonth)
//        print(currentDate.startDateOfMonth)
//        print(currentDate.endDateOfMonth)
//        print(currentDate.dayNumberOfWeek)
//
//
//        let previousMonthDate = calendar.date(byAdding: .month, value: -1, to: currentDate)!
//        print(previousMonthDate)
//
//        print(calendar.locale)
//        let previousMonth = calendar.component(.month, from: previousMonthDate)
        
//        print(previousMonthDate.startDateOfMonth)
//        print(previousMonthDate.endDateOfMonth)


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
