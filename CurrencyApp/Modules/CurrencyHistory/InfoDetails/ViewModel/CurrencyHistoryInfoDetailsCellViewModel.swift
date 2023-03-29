//
//  CurrencyHistoryInfoDetailsCellViewModel.swift
//  CurrencyApp
//
//  Created by developer_tmp on 22.03.2023.
//

import UIKit

enum CurrencyRateState {
    case up
    case down
    case same
}

final class CurrencyHistoryInfoDetailsCellViewModel {
    
    // MARK: - Properties
    // MARK: Content
    
    private(set) var content : RateWithDate

    
    var didSelected: Bool
    var choosenCurrency: String
    var currancyRateState: CurrencyRateState
    
    //MARK: - Initialization
    
    init(content: RateWithDate, didSelected: Bool, choosenCurrency: String, currancyRateState: CurrencyRateState) {
        self.content = content
        self.didSelected = didSelected
        self.choosenCurrency = choosenCurrency
        self.currancyRateState = currancyRateState
    }
    
    // MARK: - Appearance
    
    var title: String {
        prepareDate(date: content.date)
    }
    
    var value: String {
        getNecessaryExchangeRate(choosenCurrency: choosenCurrency, content: content)
    }
    
    var iconName: String {
        switch currancyRateState {
        case .up:
            return "arrow.up.right"
        case .down:
            return "arrow.down.right"
        case .same:
            return "arrow.right"
        }
    }
    
    var color: UIColor {
        switch currancyRateState {
        case .up:
            return .systemGreen
        case .down:
            return .systemRed
        case .same:
            return .systemGray
        }
    }
    
    func getNecessaryExchangeRate(choosenCurrency: String, content: RateWithDate) -> String {
        for rate in content.rate{
            if rate.currencyName == choosenCurrency{
                return String(format: "%.2f", rate.exchangeCourse)
            }
        }
        return "Information about currency wasn't found"
    }
    
    func prepareDate(date: String) -> String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let date = dateFormatter.date(from: date)
        dateFormatter.dateFormat = "dd.MM.yyyy"
        return dateFormatter.string(from: date!)
    }
}
