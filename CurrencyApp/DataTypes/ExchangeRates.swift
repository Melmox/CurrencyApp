//
//  ExchangeRates.swift
//  CurrencyApp
//
//  Created by developer_tmp on 22.03.2023.
//

import Foundation

protocol ExchangeRates {
    var success: Bool { get set }
    var base: String { get set }
}

struct ExchangeRatesLatest: ExchangeRates, Codable {
    var success: Bool
    var base: String
    
    var date: String
    var _rates: [String : Double]
    
    enum CodingKeys: String, CodingKey {
        case success = "success"
        case base = "base"
        case date = "date"
        case _rates = "rates"
    }
    
    var rates: [Rate] {
        _rates.map { Rate(currencyName: $0.0, exchangeCourse: $0.1) }
    }
}

struct ExchangeRatesDateRange: ExchangeRates, Codable {
    var success: Bool
    var base: String
    
    var start_date, end_date: String
    var _rates: [String : [String : Double]]

    enum CodingKeys: String, CodingKey {
        case success = "success"
        case base = "base"
        case start_date = "start_date"
        case end_date = "end_date"
        case _rates = "rates"
    }

    var rates: [RateWithDate] {
        _rates.map { RateWithDate(date: $0.0, rate:  $0.1.map { Rate(currencyName: $0.0, exchangeCourse: $0.1)})}
    }
}

struct Rate: Codable{
    
    var currencyName: String
    var exchangeCourse: Double
}

struct RateWithDate: Codable {
    var date: String
    var rate: [Rate]
}


