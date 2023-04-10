//
//  CreditCard.swift
//  CurrencyApp
//
//  Created by developer_tmp on 06.04.2023.
//

import Foundation

struct CreditCard: Decodable {
    let cardNumber: String
    let currency: String
    let balance: Double
    let cardholderName: String
    let openDate: String
}
