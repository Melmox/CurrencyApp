//
//  TabBarController.swift
//  CurrencyApp
//
//  Created by developer_tmp on 13.03.2023.
//

import UIKit

private enum TabBarPage: Int, CaseIterable{
    case wallet = 0
    case currencyHistory = 1
    
    var title: String {
        switch self {
        case .wallet:
            return "Wallet"
        case .currencyHistory:
            return "Currency History"
        }
    }
    
    var image: UIImage {
        switch self {
        case .wallet:
            return UIImage(systemName: "briefcase")!
        case .currencyHistory:
            return UIImage(systemName: "clock")!
        }
    }
    
    var tag: Int {
        switch self {
        case .wallet:
            return self.rawValue
        case .currencyHistory:
            return self.rawValue
        }
    }
    
    static var allCases: [TabBarPage] {
        return [.wallet, .currencyHistory]
    }
}

final class TabBarController: UITabBarController, UITabBarControllerDelegate {
    
    // MARK: - Properties
//    fileprivate let currentTab: TabBarPage = .wallet
//    var walletViewController = WalletController(collectionViewLayout: UICollectionViewLayout())
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Assign self for delegate for that ViewController can respond to UITabBarControllerDelegate methods
        self.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
//                getAPICall()
    }
    
    // MARK: - Appearance
    
    func configureTabItems(with controllers: [UIViewController]) {
        let tabBarPages = TabBarPage.allCases
        var viewControllersOnTabBar: [UIViewController] = []
        if controllers.count == tabBarPages.count{
            for index in 0...controllers.count - 1 {
                viewControllersOnTabBar.append(createTabItem(viewController: controllers[index], pageType: tabBarPages[index]))
            }
        }
        self.setViewControllers(viewControllersOnTabBar, animated: true)
//        self.viewControllers = viewControllersOnTabBar
        
    }
    
    private func createTabItem(viewController: UIViewController, pageType: TabBarPage) -> UIViewController {
        let tab = viewController
        let tabBarItem = UITabBarItem(title: pageType.title,
                                      image: pageType.image,
                                      tag: pageType.tag)
        tab.tabBarItem = tabBarItem
        return tab
    }
    
    // MARK: - UITabBarControllerDelegate
    
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        //        print("Selected \(viewController.title!)")
    }
    
    
}
