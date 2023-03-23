//
//  ExchangeRates.swift
//  CurrencyApp
//
//  Created by developer_tmp on 22.03.2023.
//

import Foundation

// MARK: - ApiResponseStructure
struct ApiResponseStructure: Codable {
    let response: ExchangeRates
}


// MARK: - Response
struct ExchangeRates: Codable {
    //    let date: Date // for "/latest" it is Date
    //    let date: String // for "/historical" it is String
    var date, base: String
    var rates: [String: Double]
    
    init(date: String, base: String, rates: [String : Double]) {
        self.date = date
        self.base = base
        self.rates = rates
    }
}

extension ExchangeRates {
    func prepareForBaseCurrencyRate() -> [String: Double] {
//    mutating func prepareForBaseCurrencyRate(){

        var preparedDictionary : [String : Double] = [:]
        
        for rate in self.rates {
            preparedDictionary.updateValue(1/rate.value, forKey: rate.key)
        }
//        self.rates = preparedDictionary
        return preparedDictionary
    }
}
    
var someTestData = ExchangeRates(date: "18.03.2023", base: "UAH", rates: ["USD": 0.04199034,
                                                                          "EUR": 0.0376191,
                                                                          "GBP": 0.03211844,
                                                                          "INR": 3.01423406,
                                                                          "AUD": 0.06037806,
                                                                          "CAD": 0.05458492,
                                                                          "SGD": 0.05668141,
                                                                          "CHF": 0.04082162,
                                                                          "MYR": 0.17228638,])

