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
    var cellViewModel: WalletDetailsCellTopUpViewModel = WalletDetailsCellTopUpViewModel(creditCards: [])
    var walletCardDetaisTabState: WalletCardDetaisTab?
    
    // MARK: - Services
    
    private var cardService: CardServiceable?

    // MARK: Callbacks
    
    var willReload: EmptyClosure?
    var choosenTab: ((WalletCardDetaisTab) -> ())?
    
    // MARK: - Initialization
    
    init(coordinator: MainFlowCoordinator, cardService: CardServiceable) {
        self.coordinator = coordinator
        self.cardService = cardService
    }
    
    // MARK: - Appearance
    
    func configure() {
        cardService?.getCreditCards(completion: { [weak self] creditCards in
            self?.cellViewModel.creditCards = creditCards.filter { card in
                return card.cardNumber != self?.cardInfoViewModel?.creditCard?.cardNumber
            }
            self?.willReload?()
        })
        
        choosenTab = { state in
            self.walletCardDetaisTabState = state
            if let willReload = self.willReload {
                willReload()
            }
        }
    }
    
    // MARK: - Provider
    
    
    // MARK: - Navigation
    
}
