//
//  ExchangeRates.swift
//  CurrencyApp
//
//  Created by developer_tmp on 22.03.2023.
//

import Foundation

// MARK: - ApiResponseStructure

protocol ExchangeRates {
    var success: Bool { get set }
    var base: String { get set }
//    var date: String { get set }
    }

struct ExchangeRatesLatest: ExchangeRates, Codable {
    var success: Bool
    var base: String
    
    var date: String
    var rates: [String: Double]
}

struct ExchangeRatesDateRange: ExchangeRates, Codable {
    var success: Bool
    var base: String
    
    var start_date, end_date: String
    var rates: [String: [String: Double]]
    
}

extension ExchangeRatesLatest {
    func prepareForBaseCurrencyRate() -> [String: Double] {
//    mutating func prepareForBaseCurrencyRate(){

        var preparedDictionary : [String : Double] = [:]
        
        for rate in self.rates {
            preparedDictionary.updateValue(Double(round(100 * 1/rate.value) / 100), forKey: rate.key)
        }
//        self.rates = preparedDictionary
        return preparedDictionary
    }
}
    
var someTestData = ExchangeRatesLatest(success: true, base: "UAH", date: "18.03.2023", rates: ["USD": 0.04199034,
                                                                          "EUR": 0.0376191,
                                                                          "GBP": 0.03211844,
                                                                          "INR": 3.01423406,
                                                                          "AUD": 0.06037806,
                                                                          "CAD": 0.05458492,
                                                                          "SGD": 0.05668141,
                                                                          "CHF": 0.04082162,
                                                                          "MYR": 0.17228638,])

