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
    
    var headerViewModel: WalletDetailsHeaderViewModel?
    var cellViewModel: WalletDetailsCellTopUpViewModel?
    
    var selectedCard: CreditCard?
        
    var walletCardDetaisTabState: WalletCardDetaisTab = .topUp
    
    // MARK: - Services
    
    private var cardService: CardServiceable?
    private var exchangeRateService: ExchangeRateServiceable?
    
    // MARK: Callbacks
    
    var willReload: EmptyClosure?
    var choosenTab: ((WalletCardDetaisTab) -> ())?
    
    // MARK: - Initialization
    
    init(coordinator: MainFlowCoordinator, cardService: CardServiceable, exchangeRateService: ExchangeRateServiceable) {
        self.coordinator = coordinator
        self.cardService = cardService
        self.exchangeRateService = exchangeRateService
    }
    
    // MARK: - Appearance
    
    func configure() {
        cardService?.getCreditCards(completion: { [weak self] creditCards in
            self?.cellViewModel?.creditCards = creditCards.filter { card in
                return card.cardNumber != self?.selectedCard?.cardNumber
            }
            self?.cellViewModel?.curentCard = self?.selectedCard
            self?.willReload?()
        })
        
        choosenTab = { [weak self] (state) in
            self?.walletCardDetaisTabState = state
            if let willReload = self?.willReload {
                willReload()
            }
        }
        
        cellViewModel?.sendMoneyClicked = { [weak self] in
            let curentCard = self?.cellViewModel?.curentCard
            let pickedCard = self?.cellViewModel?.pickedCard
            let amountMoneyToTransfer = self?.cellViewModel?.amountMoneyToTransfer
            self?.transferMoney(from: curentCard, to: pickedCard, for: amountMoneyToTransfer)
        }
        
//        cellViewModel.getExchangedValue = { [weak self] (selectedCard, amountToTransfer) in
//            if let currentCardCurrency = self?.cellViewModel.curentCard?.currency,
//               let takeCardCurrency = selectedCard?.currency {
//                self?.exchangeRateService?.getExchangeRateData(endpoint: ExchangeRatesLatest.self, baseCurrency: currentCardCurrency, start_date: nil, end_date: nil, completion: { [weak self] (response) in
//                    let exchangeRate = response?._rates[takeCardCurrency] ?? 0
//                    self?.cellViewModel.exchangedValue = amountToTransfer * exchangeRate
//                })
//            }
//        }
    }
    
    // MARK: - Provider
    
    func transferMoney(from currentCard: CreditCard?, to pickedCard: CreditCard?, for amountMoneyToTransfer: Double?) {
        let currentCardCurrency = currentCard?.currency ?? ""
        let pickedCardCurrency = pickedCard?.currency ?? ""
        let amountMoneyToTransfer = amountMoneyToTransfer ?? 0.0
        exchangeRateService?.getExchangeRateData(endpoint: ExchangeRatesLatest.self, baseCurrency: currentCardCurrency, start_date: nil, end_date: nil, completion: { [weak self] (response) in
            let exchangeRate = response?._rates[pickedCardCurrency] ?? 0
            let amountMoneyToTake = amountMoneyToTransfer
            let amountMoneyToAdd = amountMoneyToTransfer * exchangeRate
            let pickedCardUid = pickedCard?.cardUid ?? ""
            let currentCardUid = currentCard?.cardUid ?? ""
            self?.cardService?.updateCreditCardBalance(from: currentCardUid, to: pickedCardUid, with: amountMoneyToTake, with: amountMoneyToAdd, onSuccess: { [weak self] in
                if let reload = self?.willReload{
                    reload()
                }
                self?.coordinator?.presentPopUpController(with: "Money transfered successfully")
            })
        })
    }
    
    // MARK: - Navigation
    
}
