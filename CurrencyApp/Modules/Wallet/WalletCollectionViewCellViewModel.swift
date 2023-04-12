//
//  WalletCollectionViewCellViewModel.swift
//  CurrencyApp
//
//  Created by developer_tmp on 17.03.2023.
//

import Foundation

enum CardCellState {
    case addCard, normalCard
}

final class WalletCollectionViewCellViewModel {

    // MARK: - Properties
    // MARK: Content
    
    var creditCard: CreditCard?
    var currency: String? {
        creditCard?.currency
    }
    var cardNumber: String? {
        creditCard?.cardNumber
    }
    var balance: Double? {
        creditCard?.balance
    }
    var cardholderName: String? {
        creditCard?.cardholderName
    }
    var openDate: String? {
        creditCard?.openDate
    }
    var isFirst: Bool?
    var isLast: Bool?
    var state: CardCellState?

    // MARK: - Initialization
    
    init(content: CreditCard?, state: CardCellState) {
        creditCard = content
        self.state = state
    }
}
