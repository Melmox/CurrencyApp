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
        if exchangeCureencyRates != nil && selectedCurrency != nil {
            cellViewModels = exchangeCureencyRates!.rates.map { key, value in
                CurrencyHistoryInfoDetailsCellViewModel(currencyExchangeCource: String(value[selectedCurrency!] ?? 0.0),
                                                        date: key,
                                                        imageName: "arrow.right")
            }
            cellViewModels = cellViewModels.sorted(by: {
                if $0.date != $1.date { return $0.date < $1.date }
                else {
                    return String(describing: $0.date) < String(describing: $1.date)
                }
            })
            for cellViewModelIndex in 0...numberOfItems-1 {
                if cellViewModelIndex > 0{
                    if (Double(cellViewModels[cellViewModelIndex].currencyExchangeCource) ?? 0.0 > Double(cellViewModels[cellViewModelIndex - 1].currencyExchangeCource) ?? 0.0){
                        cellViewModels[cellViewModelIndex].setNewImageName(newImageName: "arrow.up.right")
                    }
                    if (Double(cellViewModels[cellViewModelIndex].currencyExchangeCource) ?? 0.0 < Double(cellViewModels[cellViewModelIndex - 1].currencyExchangeCource) ?? 0.0){
                        cellViewModels[cellViewModelIndex].setNewImageName(newImageName: "arrow.down.right")
                    }
                }
            }
            willReload?()
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
