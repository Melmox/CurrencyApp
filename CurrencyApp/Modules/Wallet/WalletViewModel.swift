//
//  WalletViewModel.swift
//  CurrencyApp
//
//  Created by developer_tmp on 16.03.2023.
//

import Foundation

final class WalletViewModel: BasicControllerViewModel {
    
    //MARK: - Properties
    //MARK: Content
    
    private weak var coordinator: MainFlowCoordinator?
    lazy var cellViewModels: [WalletTableViewCellViewModel] = []
    
    //MARK: Callbacks
    
    var willReload: (() -> ())?
    
    
    //MARK: - Init
    
    init(coordinator: MainFlowCoordinator) {
        self.coordinator = coordinator
    }
    
    //MARK: - Appearance
    
    func configure() {
        let networkManager: NetworkManager = NetworkManager()
        networkManager.getData(endpoint: ExchangeRatesLatest.self, baseCurrency: "UAH") { [weak self] latestRates in
            if let latestRates {
                self!.cellViewModels = latestRates.rates.map { rate in
                    WalletTableViewCellViewModel(title: "Per 1 \(rate.currencyName) you can buy \(String(format: "%.2f", 1/rate.exchangeCourse)) \(latestRates.base)")
                }
                self!.willReload?()
            } else {
                print("some error")
            }
        }
    }
    
    func item(at indexPath: IndexPath) -> WalletTableViewCellViewModel{
        return cellViewModels[indexPath.row]
    }
    
    //MARK: - Provider
    
    var numberOfItems: Int {
        cellViewModels.count
    }
    
    //MARK: - Navigation
    
    func coordinateNextPage() {
        coordinator?.presentWalletSettingsController()
    }
}
