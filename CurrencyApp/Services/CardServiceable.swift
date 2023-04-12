//
//  CardServiceable.swift
//  CurrencyApp
//
//  Created by developer_tmp on 07.04.2023.
//

import Foundation

protocol CardServiceable {
    func addCreditCard(with currency: String)
    
    func getCreditCards(completion: @escaping ([CreditCard]) -> Void)

}
