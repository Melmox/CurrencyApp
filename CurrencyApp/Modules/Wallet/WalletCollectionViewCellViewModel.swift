//
//  WalletCollectionViewCellViewModel.swift
//  CurrencyApp
//
//  Created by developer_tmp on 17.03.2023.
//

import Foundation

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
    
    var isFirst: Bool?
    
    var isLast: Bool?

    // MARK: - Init
    
    init(content: CreditCard) {
        creditCard = content
    }
}
