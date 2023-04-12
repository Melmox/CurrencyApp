//
//  ExchangeRateService.swift
//  CurrencyApp
//
//  Created by developer_tmp on 12.04.2023.
//

import Foundation

final class ExchangeRateService: ExchangeRateServiceable {
    
    // MARK: - Properties
    // MARK: Content
    
    private let alamofireManager = AlamofireManager()
    
    // MARK: - Methods
    
    func getExchangeRateData<T>(
        endpoint: T.Type,
        baseCurrency: String,
        start_date: String? = nil,
        end_date: String? = nil,
        completion: @escaping (T?) -> Void) where T : Decodable, T : Encodable {
            alamofireManager.getData(endpoint: endpoint,
                                     baseCurrency: baseCurrency,
                                     start_date: start_date,
                                     end_date: end_date) { ratest in
                completion(ratest)
            }
        }
    
}
