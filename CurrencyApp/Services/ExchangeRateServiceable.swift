//
//  ExchangeRateServiceable.swift
//  CurrencyApp
//
//  Created by developer_tmp on 12.04.2023.
//

import Foundation

protocol ExchangeRateServiceable {
    func getExchangeRateData<T: Codable>(
        endpoint: T.Type,
        baseCurrency: String,
        start_date: String?,
        end_date: String?,
        completion: @escaping (T?) -> Void)
}
