//
//  CurrencyHistoryCurrencyNameViewModel.swift
//  CurrencyApp
//
//  Created by developer_tmp on 22.03.2023.
//

import Foundation
import UIKit

final class CurrencyHistoryCurrencyNameViewModel: BasicControllerViewModel {
    
    // MARK: - Properties
    // MARK: Content

    let currentDate = Date()
    let dateFormatter = DateFormatter()
    
    private weak var coordinator: MainFlowCoordinator?
    lazy var cellViewModels: [CurrencyHistoryCurrencyNameCellViewModel] = []
    
    var downloadedData: ExchangeRatesDateRange?
    var previousMonthDownloadedData: ExchangeRatesDateRange?
    
    // MARK: - Services
    
    private var ratesService: ExchangeRateServiceable?
    
    // MARK: Callbacks
    
    var willReload: (() -> ())?
        
    // MARK: - Initialization
    
    init(coordinator: MainFlowCoordinator, ratesService: ExchangeRateServiceable) {
        self.coordinator = coordinator
        self.ratesService = ratesService
    }
    
    // MARK: - Appearance
    
    func configure() {
        // MARK: Download Current Month Data
        dateFormatter.dateFormat = "yyyy-MM-dd"
        ratesService?.getExchangeRateData(endpoint: ExchangeRatesDateRange.self,
                               baseCurrency: "USD",
                               start_date: dateFormatter.string(from: currentDate.startDateOfMonth),
                               end_date: dateFormatter.string(from: currentDate))
        { [weak self] latestRates in
            if let latestRates {
                if (latestRates.rates.first != nil && self != nil){
                    self!.cellViewModels = latestRates.rates.first!.rate.map { rate in
                        CurrencyHistoryCurrencyNameCellViewModel(currencyName: rate.currencyName)
                    }
                    self!.willReload?()
                    self!.downloadedData = latestRates
                }
            } else {
                print("some error")
            }
        }
        
        // MARK: Download Previous Month Data
        
        guard let previousMonthDate = Calendar.current.date(byAdding: DateComponents(month: -1), to: currentDate) else {
            fatalError("Unable to get end date from date")
        }
        ratesService?.getExchangeRateData(endpoint: ExchangeRatesDateRange.self,
                               baseCurrency: "USD",
                               start_date: dateFormatter.string(from: previousMonthDate.startDateOfMonth),
                               end_date: dateFormatter.string(from: previousMonthDate.endDateOfMonth))
        { [weak self] latestRates in
            if let latestRates {
                if (latestRates.rates.first != nil && self != nil){
                    self!.previousMonthDownloadedData = latestRates
                }
            } else {
                print("some error")
            }
        }
        
    }
        
    // MARK: - Provider
    
    func item(at indexPath: IndexPath) -> CurrencyHistoryCurrencyNameCellViewModel {
        return cellViewModels[indexPath.row]
    }
    
    var numberOfItems: Int {
        cellViewModels.count
    }
    
    // MARK: - Navigation
    
    func coordinateNextPage(title: String) {
        coordinator?.presentCurrencyHistoryInfoDetailsController(title: title, data: downloadedData, previousMonthData: previousMonthDownloadedData)
    }
}
