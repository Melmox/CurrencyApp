//
//  WalletViewModel.swift
//  CurrencyApp
//
//  Created by developer_tmp on 16.03.2023.
//

import Foundation

final class WalletViewModel: BasicControllerViewModel {
    
    // MARK: - Properties
    // MARK: Content
    
    private weak var coordinator: MainFlowCoordinator?
    
    lazy var cellViewModels: [WalletTableViewCellViewModel] = []
    lazy var collectionCellViewModels: [WalletCollectionViewCellViewModel] = []
    var tableHeaderViewModel: TableViewHeaderViewModel?

    // MARK: - Services
    
    private var cardService: CardServiceable?

    // MARK: Callbacks
    
    var willReload: EmptyClosure?
    var willReloadHeader: EmptyClosure?
    
    // MARK: - Initialization
    
    init(coordinator: MainFlowCoordinator, cardService: CardServiceable) {
        self.coordinator = coordinator
        self.cardService = cardService
    }
    
    // MARK: - Appearance
    
    func configure() {
        let networkManager: NetworkManager = NetworkManager()
        networkManager.getData(endpoint: ExchangeRatesLatest.self, baseCurrency: "UAH") { [weak self] latestRates in
            if let latestRates {
                self?.cellViewModels = latestRates.rates.map { rate in
                    WalletTableViewCellViewModel(title: "Per 1 \(rate.currencyName) you can buy \(String(format: "%.2f", 1/rate.exchangeCourse)) \(latestRates.base)")
                }
                self?.willReload?()
            } else {
                print("some error")
            }
        }
        cardService?.getCreditCards(completion: { [weak self] creditCards in
            self?.collectionCellViewModels = creditCards.map { card in
                WalletCollectionViewCellViewModel(content: card)
            }
            self?.tableHeaderViewModel = TableViewHeaderViewModel(items: self?.collectionCellViewModels)
            self?.willReloadHeader?()
        })
    }
    
    // MARK: - Provider
    
    func item(at indexPath: IndexPath) -> WalletTableViewCellViewModel{
        return cellViewModels[indexPath.row]
    }
    
    func collectionItem(at indexPath: IndexPath) -> WalletCollectionViewCellViewModel{
        return collectionCellViewModels[indexPath.row]
    }
    
    var numberOfItems: Int {
        cellViewModels.count
    }
    
    var numberOfCollectionItems: Int {
        collectionCellViewModels.count
    }
    
    // MARK: - Navigation
    
    func coordinateSettingsPage() {
        coordinator?.presentWalletSettingsController()
    }
    
    func coordinateDetailsPage(with cardInfo: WalletCollectionViewCellViewModel) {
        coordinator?.presentWalletDetailsController(with: cardInfo)
    }
}
