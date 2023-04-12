//
//  CardService.swift
//  CurrencyApp
//
//  Created by developer_tmp on 07.04.2023.
//

import Foundation

final class CardService: CardServiceable {
    
    // MARK: - Properties
    // MARK: Content

    private let firebaseManager = FirebaseManager()
    
    // MARK: - Methods
    
    func addCreditCard(with currency: String) {
        firebaseManager.addCreditCard(currency: currency)
    }
    
    func getCreditCards(completion: @escaping ([CreditCard]) -> Void) {
        firebaseManager.getCreditCards(completion: { creditCard in
            completion(creditCard)
        })
    }
    
    
}
