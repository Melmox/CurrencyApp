//
//  CurrencyHistoryCurrencyNameViewModel.swift
//  CurrencyApp
//
//  Created by developer_tmp on 22.03.2023.
//

import Foundation
import UIKit

final class CurrencyHistoryCurrencyNameViewModel: BasicControllerViewModel {
    
    //MARK: - Properties
    let currentDate = Date()
    let dateFormatter = DateFormatter()

    //MARK: Content
    
    private weak var interfaceCoordinator: MainFlowCoordinator?
    lazy var cellViewModels: [CurrencyHistoryCurrencyNameCellViewModel] = []
    
    var downloadedData: ExchangeRatesDateRange?
    var previousMonthDownloadedData: ExchangeRatesDateRange?

    
    //MARK: Callbacks
    
    var willReload: (() -> ())?
        
    
    //MARK: - Init
    
    init(coordinator: MainFlowCoordinator) {
        interfaceCoordinator = coordinator
    }
    
    //MARK: - Appearance
    
    func configure() {
        // MARK: - DownloadData
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let networkManager: NetworkManager = NetworkManager()
        networkManager.getData(endpoint: ExchangeRatesDateRange.self,
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
        
        // MARK: - PreviousMonthDownloadData
        guard let previousMonthDate = Calendar.current.date(byAdding: DateComponents(month: -1), to: currentDate) else {
            fatalError("Unable to get end date from date")
        }
        networkManager.getData(endpoint: ExchangeRatesDateRange.self,
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
    
    func item(at indexPath: IndexPath) -> CurrencyHistoryCurrencyNameCellViewModel {
        return cellViewModels[indexPath.row]
    }
    
    //MARK: - Provider
    
    var numberOfItems: Int {
        cellViewModels.count
    }
    
    //MARK: - Navigation
    
    func coordinateNextPage(title: String) {
        interfaceCoordinator?.presentCurrencyHistoryInfoDetailsController(title: title, data: downloadedData, previousMonthData: previousMonthDownloadedData)
    }
    
}
