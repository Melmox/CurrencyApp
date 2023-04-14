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
    var willReloadHeader: EmptyClosure?
    var willReloadCell: EmptyClosure?
    var choosenTab: ((WalletCardDetaisTab) -> ())?
    
    // MARK: - Initialization
    
    init(coordinator: MainFlowCoordinator, cardService: CardServiceable, exchangeRateService: ExchangeRateServiceable) {
        self.coordinator = coordinator
        self.cardService = cardService
        self.exchangeRateService = exchangeRateService
    }
    
    // MARK: - Appearance
    
    func configure() {
        choosenTab = { [weak self] (state) in
            self?.walletCardDetaisTabState = state
            if let willReload = self?.willReload {
                willReload()
            }
        }
        
        headerViewModel = WalletDetailsHeaderViewModel(creditCard: selectedCard, choosenSegment: choosenTab)
        cellViewModel = WalletDetailsCellTopUpViewModel()
        
        cardService?.getCreditCards(completion: { [weak self] creditCards in
            self?.cellViewModel?.creditCards = creditCards.filter { card in
                return card.cardNumber != self?.selectedCard?.cardNumber
            }
            self?.cellViewModel?.curentCard = self?.selectedCard
            self?.willReload?()
        })
        
        cellViewModel?.prepareForSendingMoney = { [weak self] in
            self?.prepareToTransfer {
                self?.cellViewModel?.buttonState = .confirm
                self?.willReloadCell?()
            }
        }
    
        cellViewModel?.sendMoneyClicked = { [weak self] in
            let curentCard = self?.cellViewModel?.curentCard
            let pickedCard = self?.cellViewModel?.pickedCard
            let amountMoneyToTransfer = self?.cellViewModel?.amountMoneyToTransfer
            self?.transferMoney(from: curentCard, to: pickedCard, for: amountMoneyToTransfer, onSuccess: { [weak self] in
                self?.coordinator?.presentPopUpController(with: "Money transfered successfully", on: .success)
                self?.cellViewModel?.buttonState = .sendMoney
                self?.updateSelectedCard(onSuccess: {
                    self?.willReload?()
                    self?.willReloadHeader?()
                })
            }, onError: {
                self?.coordinator?.presentPopUpController(with: "Your money wasn't transfered cause some error", on: .error)
            })
        }
        willReload?()
        willReloadHeader?()
    }
    
    // MARK: - Provider
    
    func prepareToTransfer(onSuccess: @escaping EmptyClosure) {
        if let currentCardCurrency = cellViewModel?.curentCard?.currency,
           let takeCardCurrency = cellViewModel?.pickedCard?.currency,
           let amountToTransfer =  cellViewModel?.amountMoneyToTransfer{
            self.exchangeRateService?.getExchangeRateData(endpoint: ExchangeRatesLatest.self, baseCurrency: currentCardCurrency, start_date: nil, end_date: nil, completion: { [weak self] (response) in
                let exchangeRate = response?._rates[takeCardCurrency] ?? 0
                self?.cellViewModel?.exchangedValue = amountToTransfer * exchangeRate
                onSuccess()
            })
        }
    }
    
    func transferMoney(from currentCard: CreditCard?, to pickedCard: CreditCard?, for amountMoneyToTransfer: Double?, onSuccess: @escaping EmptyClosure, onError: @escaping EmptyClosure) {
        let currentCardCurrency = currentCard?.currency ?? ""
        let pickedCardCurrency = pickedCard?.currency ?? ""
        let amountMoneyToTransfer = amountMoneyToTransfer ?? 0.0
        exchangeRateService?.getExchangeRateData(endpoint: ExchangeRatesLatest.self, baseCurrency: currentCardCurrency, start_date: nil, end_date: nil, completion: { [weak self] (response) in
            let exchangeRate = response?._rates[pickedCardCurrency] ?? 0
            let amountMoneyToTake = amountMoneyToTransfer
            let amountMoneyToAdd = amountMoneyToTransfer * exchangeRate
            let pickedCardUid = pickedCard?.cardUid ?? ""
            let currentCardUid = currentCard?.cardUid ?? ""
            self?.cardService?.updateCreditCardBalance(from: currentCardUid, to: pickedCardUid, with: amountMoneyToTake, with: amountMoneyToAdd, onSuccess: {
                onSuccess()
            }, onError: {
                onError()
            })
        })
    }
    
    func updateSelectedCard(onSuccess: @escaping EmptyClosure) {
        cardService?.getCreditCards(completion: {[weak self] creditCards in
            let card = creditCards.filter { card in
                return card.cardUid == self?.selectedCard?.cardUid
            }
            self?.headerViewModel?.creditCard = card[0]
            onSuccess()
        })
    }
}
