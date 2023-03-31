//
//  DateExtension.swift
//  CurrencyApp
//
//  Created by developer_tmp on 30.03.2023.
//

import Foundation

extension Date {
    var startDateOfMonth: Date {
        guard let date = Calendar.current.date(from: Calendar.current.dateComponents([.year, .month], from: self))
        else {
            fatalError("Unable to get start date from date")
        }
        return date
    }
    
    var endDateOfMonth: Date {
        guard let date = Calendar.current.date(byAdding: DateComponents(month: 1, day: -1), to: self.startDateOfMonth) else {
            fatalError("Unable to get end date from date")
        }
        return date
    }
    
    var numberOfWeekInMonth: Int {
        var calendar = Calendar.current
        calendar.locale = Locale(identifier: "uk")
        return calendar.component(.weekOfMonth, from: self)
    }
    
    var numberOfMonthInYear: Int {
        var calendar = Calendar.current
        calendar.locale = Locale(identifier: "uk")
        return calendar.component(.month, from: self)
    }
}
