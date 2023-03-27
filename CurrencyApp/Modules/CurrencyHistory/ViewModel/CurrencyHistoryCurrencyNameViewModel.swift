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
    let monthEarlierDate = Calendar.current.date(byAdding: .month, value: -1, to: Date())
    let dateFormatter = DateFormatter()

    //MARK: Content
    
    private weak var interfaceCoordinator: Coordinator?
    lazy var cellViewModels: [CurrencyHistoryCurrencyNameCellViewModel] = []
    
    var downloadedData: ExchangeRatesDateRange?
    
    //MARK: Callbacks
    
    var willReload: (() -> ())?
        
    
    //MARK: - Init
    
    init(coordinator: Coordinator) {
        interfaceCoordinator = coordinator
    }
    
    //MARK: - Appearance
    
    func configure() {
        dateFormatter.dateFormat = "yyyy-MM-dd"
        
        let networkManager: NetworkManager = NetworkManager()
        networkManager.getData(endpoint: ExchangeRatesDateRange.self,
                               baseCurrency: "UAH",
                               start_date: dateFormatter.string(from: monthEarlierDate ?? currentDate),
                               end_date: dateFormatter.string(from: currentDate))
        { [weak self] latestRates in
            if let latestRates {
                if latestRates.rates.values.first != nil && self != nil{
                    self!.cellViewModels = latestRates.rates.values.first!.map { key, value in
                            CurrencyHistoryCurrencyNameCellViewModel(currencyName: key)
                    }
                    self!.willReload?()
                    self!.downloadedData = latestRates
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
        interfaceCoordinator?.presentCurrencyHistoryInfoDetailsController(title: title, data: downloadedData)
    }
    
}
