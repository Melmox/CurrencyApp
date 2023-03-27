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
    
    private weak var interfaceCoordinator: Coordinator?
    lazy var cellViewModels: [WalletTableViewCellViewModel] = []
    
    //MARK: Callbacks
    
    var willReload: (() -> ())?
    
    
    //MARK: - Init
    
    init(coordinator: Coordinator) {
        interfaceCoordinator = coordinator
    }
    
    //MARK: - Appearance
    
    func configure() {
        let networkManager: NetworkManager = NetworkManager()
        networkManager.getData(endpoint: ExchangeRatesLatest.self, baseCurrency: "UAH") { [weak self] latestRates in
            if let latestRates {
                self!.cellViewModels = latestRates.prepareForBaseCurrencyRate().map { key, value in
                    WalletTableViewCellViewModel(title: "Per 1 \(key) you can buy \(Double(round(100 * value) / 100)) \(latestRates.base)")
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
    
    
}
