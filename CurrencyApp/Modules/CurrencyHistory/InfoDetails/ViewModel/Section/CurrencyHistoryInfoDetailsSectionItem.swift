//
//  CurrencyHistoryInfoDetailsSectionItem.swift
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

final class CurrencyHistoryInfoDetailsSectionItem {
    
    // MARK: - Properties
    // MARK: Content
    
    private(set) var content : RateWithDate
    
    private var decodeFormatter : DateFormatter {
        let decodeFormatter = DateFormatter()
        decodeFormatter.dateFormat = "yyyy-MM-dd"
        return decodeFormatter
    }
    
    private let prepareFormatter = DateFormatter()
    
    let numberOfCurrentWeek = Date().numberOfWeekInMonth
    let numberOfCurrentMonth = Date().numberOfMonthInYear
    
    var didSelected: Bool
    var choosenCurrency: String
    var currancyRateState: CurrencyRateState
    
    var getNumberOfWeekInMonth: Int {
        guard let date = decodeFormatter.date(from: self.content.date) else {
            fatalError("Unable to get date format from this date")
        }
        return date.numberOfWeekInMonth
    }
    
    var getNumberOfMonthInYear: Int {
        guard let date = decodeFormatter.date(from: self.content.date) else {
            fatalError("Unable to get date format from this date")
        }
        return date.numberOfMonthInYear
    }
    
    private func configurePrepareFormatter() {
        prepareFormatter.timeStyle = .none
        prepareFormatter.dateStyle = .medium
        prepareFormatter.locale = Locale(identifier: "en_GB")
        prepareFormatter.doesRelativeDateFormatting = true
    }
    
    private func getNecessaryExchangeRate(choosenCurrency: String, content: RateWithDate) -> String {
        for rate in content.rate{
            if rate.currencyName == choosenCurrency{
                return String(format: "%.2f", rate.exchangeCourse)
            }
        }
        return "Information about currency wasn't found"
    }
    
    private func prepareDate(dateString: String) -> String{
        let cellDateNumberOfWeek = self.getNumberOfWeekInMonth
        let cellDateNumberOfMonth = self.getNumberOfMonthInYear
        
        guard let date = decodeFormatter.date(from: dateString)
        else {
            fatalError("Unable to get start date from date")
        }
        if (numberOfCurrentWeek == cellDateNumberOfWeek && numberOfCurrentMonth == cellDateNumberOfMonth) {
            configurePrepareFormatter()
            if (Calendar.current.isDateInToday(date) || Calendar.current.isDateInYesterday(date))
            {
                return prepareFormatter.string(from: date)
            } else {
                prepareFormatter.setLocalizedDateFormatFromTemplate("MMMMd")
                return prepareFormatter.string(from: date)
            }
        } else {
            prepareFormatter.dateFormat = "dd.MM.yyyy"
            return prepareFormatter.string(from: date)
        }
    }
    
    //MARK: - Initialization
    
    init(content: RateWithDate, didSelected: Bool, choosenCurrency: String, currancyRateState: CurrencyRateState) {
        self.content = content
        self.didSelected = didSelected
        self.choosenCurrency = choosenCurrency
        self.currancyRateState = currancyRateState
    }
    
    // MARK: - Appearance
    
    var title: String {
        prepareDate(dateString: content.date)
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
}
