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
    
    lazy var cellViewModels: [CurrencyHistoryInfoDetailsSectionItem] = []
    
    lazy var sectionHeaders: [CurrencyHistoryInfoDetailsSectionHeader] = []
    
    lazy var sectionViewModels: [CurrencyHistoryInfoDetailsSectionViewModel] = []
    
    lazy var items: [CurrencyHistoryInfoDetailsSectionItem] = []
    
    
    var exchangeCureencyRates: ExchangeRatesDateRange?
    var selectedCurrency: String?
    
    //MARK: Callbacks
    
    var willReload: emptyClosure?
    var willReloadSection: ((Int) -> ())?
    
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
                    return CurrencyHistoryInfoDetailsSectionItem(content: rate, didSelected: true, choosenCurrency: currency, currancyRateState: .same)
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
            
            let amountOfItemsInSection = [7, 14, numberOfItems]

            sectionHeaders = amountOfItemsInSection
                .compactMap { header in
                    CurrencyHistoryInfoDetailsSectionHeader(title: String(header) + " days")
                }
            sectionViewModels = amountOfItemsInSection
                .enumerated()
                .compactMap { n, x in
                    CurrencyHistoryInfoDetailsSectionViewModel(header: sectionHeader(at: n), items: cellViewModels, amountOfItemsInSection: amountOfItemsInSection[n])
                }
            willReload?()
        }
    }
    
    //MARK: - Provider
    //MARK: Section
    var numberOfSections: Int {
        sectionViewModels.count
    }
    
    func section(at section: Int) -> CurrencyHistoryInfoDetailsSectionViewModel {
        sectionViewModels[section]
    }
    
    //MARK: SectionHeader
    func numberOfItemsInSection(in section: Int) -> Int {
        self.section(at: section).numberOfItems
    }
    
    func sectionHeader(at section: Int) -> CurrencyHistoryInfoDetailsSectionHeader {
        sectionHeaders[section]
    }
    
    //MARK: Items
    var numberOfItems: Int {
        cellViewModels.count
    }

    func item(at indexPath: IndexPath) -> CurrencyHistoryInfoDetailsSectionItem {
        return cellViewModels[indexPath.item]
    }
    
    //MARK: Actions
    private func processItemSelection(with item: CurrencyHistoryInfoDetailsSectionItem) {
        item.didSelected.toggle()
    }
    
    func didSelectItem(at indexPath: IndexPath) {
        let item = item(at: indexPath)
        processItemSelection(with: item)
    }
    
    func didSelectSection(at section: Int) {
        willReloadSection?(section)
    }
}
