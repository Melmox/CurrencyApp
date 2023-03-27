//
//  CurrencyHistoryInfoDetailsViewModel.swift
//  CurrencyApp
//
//  Created by developer_tmp on 22.03.2023.
//

import Foundation

final class CurrencyHistoryInfoDetailsViewModel: BasicControllerViewModel {
    
    //MARK: - Properties
    let currentDate = Date()
    let monthEarlierDate = Calendar.current.date(byAdding: .month, value: -1, to: Date())
    let dateFormatter = DateFormatter()

    //MARK: Content
    
    private weak var interfaceCoordinator: Coordinator?
    lazy var cellViewModels: [CurrencyHistoryInfoDetailsCellViewModel] = []
    
    var exchangeCureencyRates: ExchangeRatesDateRange?
    
    //MARK: Callbacks
    
    var willReload: (() -> ())?
    
    var getDataFromAnotherViewModel: (() -> ExchangeRatesDateRange?)?
    
    
    //MARK: - Init
    
    init(coordinator: Coordinator) {
        interfaceCoordinator = coordinator
    }
    
    //MARK: - Appearance
    
    func configure() {
        //getDataFromAnotherViewModel()
        let tempCurrencyNameTappedOnTableView = "USD"
        
        
        dateFormatter.dateFormat = "yyyy-MM-dd"

        let networkManager: NetworkManager = NetworkManager()
        networkManager.getData(endpoint: ExchangeRatesDateRange.self,
                               baseCurrency: "UAH",
                               start_date: dateFormatter.string(from: monthEarlierDate ?? currentDate),
                               end_date: dateFormatter.string(from: currentDate))
        { [weak self] latestRates in
            if let latestRates {
                if latestRates.rates.values.first != nil && self != nil{
                    self!.cellViewModels = latestRates.rates.map { key, value in
                        CurrencyHistoryInfoDetailsCellViewModel(currencyExchangeCource: String(value[tempCurrencyNameTappedOnTableView] ?? 0.0),
                                                                    date: key,
                                                                    imageName: "arrow.up.right")
                    }
                    self!.willReload?()
                }

            } else {
                print("some error")
            }
        }
    }
    
    func item(at indexPath: IndexPath) -> CurrencyHistoryInfoDetailsCellViewModel{
        return cellViewModels[indexPath.row]
    }
    
    //MARK: - Provider
    
    var numberOfItems: Int {
        cellViewModels.count
    }
    
    //MARK: - Navigation
    
    
}
