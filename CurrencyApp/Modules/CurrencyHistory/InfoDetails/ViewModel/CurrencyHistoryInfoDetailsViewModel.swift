//
//  CurrencyHistoryInfoDetailsViewModel.swift
//  CurrencyApp
//
//  Created by developer_tmp on 22.03.2023.
//

import Foundation

final class CurrencyHistoryInfoDetailsViewModel: BasicControllerViewModel {
    
    //MARK: - Properties
    
    //MARK: Content
    
    private weak var interfaceCoordinator: Coordinator?
    lazy var cellViewModels: [CurrencyHistoryInfoDetailsCellViewModel] = []
    
    var exchangeCureencyRates: ExchangeRatesDateRange?
    var selectedCurrency: String?
    
    //MARK: Callbacks
    
    var willReload: (() -> ())?
    
    //MARK: - Init
    
    init(coordinator: Coordinator) {
        interfaceCoordinator = coordinator
    }
    
    //MARK: - Appearance
    
    func configure() {
        if let rates = exchangeCureencyRates?.rates, let currency = selectedCurrency {
            cellViewModels = rates

                .sorted(by:  {$0.date > $1.date })
                .compactMap { rate in
                    return CurrencyHistoryInfoDetailsCellViewModel(content: rate, didSelected: true, choosenCurrency: currency, currancyRateState: .same)
                }
            
            cellViewModels.enumerated().forEach { index, element in
                if index == cellViewModels.endIndex - 1 {
                    element.currancyRateState = .same
                    return
                }
                
                let nextElementValue = cellViewModels[index + 1].value
                let currentElementValue = element.value
                
                if currentElementValue == nextElementValue {
                    element.currancyRateState = .same
                    return
                }
                
                element.currancyRateState = nextElementValue < currentElementValue
                ? .up
                : .down
            }
            
            willReload?()
        }
    }
    
    func getExchangeRate(choosenCurrency: String, content: RateWithDate) -> String? {
        for rate in content.rate{
            if rate.currencyName == choosenCurrency{
                return String(format: "%.2f", rate.exchangeCourse)
            }
        }
        return nil
    }
    
    private func processItemSelection(with item: CurrencyHistoryInfoDetailsCellViewModel) {
        item.didSelected = item.didSelected ? false : true
    }
    
    //MARK: - Provider
    
    var numberOfItems: Int {
        cellViewModels.count
    }
    
    func item(at indexPath: IndexPath) -> CurrencyHistoryInfoDetailsCellViewModel {
        return cellViewModels[indexPath.item]
    }
    
    func didSelectItem(at indexPath: IndexPath) { // add hightlighted for several selected cells
        let item = item(at: indexPath)
        processItemSelection(with: item)
    }
}
