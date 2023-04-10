//
//  WalletDetailsViewModel.swift
//  CurrencyApp
//
//  Created by developer_tmp on 10.04.2023.
//

import Foundation

final class WalletDetailsViewModel: BasicControllerViewModel {
    // MARK: - Properties
    // MARK: Content
    
    private weak var coordinator: MainFlowCoordinator?
    
    var cardInfoViewModel: WalletCollectionViewCellViewModel?
    
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

    }
    
    // MARK: - Provider
    
    
    // MARK: - Navigation
    
    func coordinateNextPage() {
        coordinator?.presentWalletSettingsController()
    }
}
