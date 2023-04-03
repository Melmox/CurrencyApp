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
    
    private weak var interfaceCoordinator: MainFlowCoordinator?
    
    lazy var cellViewModels: [CurrencyHistoryInfoDetailsSectionItem] = []
    lazy var previousMonthCellViewModels : [CurrencyHistoryInfoDetailsSectionItem] = []
    lazy var sectionHeaders: [CurrencyHistoryInfoDetailsSectionHeader] = []
    lazy var sectionViewModels: [CurrencyHistoryInfoDetailsSectionViewModel] = []
        
    private var arrayOfWeeksInMonth : [Int] {
        var arrayOfWeeksInMonth : [Int] = []
        for i in (0...Date().numberOfWeekInMonth) {
            arrayOfWeeksInMonth.append(i)
        }
        return arrayOfWeeksInMonth.reversed()
    }
    
    
    var exchangeCureencyRates: ExchangeRatesDateRange?
    var previousMonthExchangeCureencyRates: ExchangeRatesDateRange?
    var selectedCurrency: String?
    
    //MARK: Callbacks
    
    var willReload: emptyClosure?
    var willReloadSection: ((Int) -> ())?
    
    //MARK: - Init
    
    init(coordinator: MainFlowCoordinator) {
        interfaceCoordinator = coordinator
    }
    
    //MARK: - Appearance
    
    func configure() {
        
        // MARK: PreviousMonthItems
        if let rates = previousMonthExchangeCureencyRates?.rates, let currency = selectedCurrency {
            previousMonthCellViewModels = rates
                .sorted(by:  {$0.date > $1.date })
                .compactMap { rate in
                    CurrencyHistoryInfoDetailsSectionItem(content: rate, didSelected: true, choosenCurrency: currency, currancyRateState: .same)
                }
            
            previousMonthCellViewModels.enumerated().forEach { index, element in
                if index == previousMonthCellViewModels.endIndex - 1 {
                    element.currancyRateState = .same
                    return
                }
                
                let nextElementValue = previousMonthCellViewModels[index + 1].value
                let currentElementValue = element.value
                
                if currentElementValue == nextElementValue {
                    element.currancyRateState = .same
                    return
                }
                
                element.currancyRateState = nextElementValue < currentElementValue
                ? .up
                : .down
            }
        }
        
        // MARK: Items
        if let rates = exchangeCureencyRates?.rates, let currency = selectedCurrency {
            cellViewModels = rates
                .sorted(by:  {$0.date > $1.date })
                .compactMap { rate in
                    CurrencyHistoryInfoDetailsSectionItem(content: rate, didSelected: true, choosenCurrency: currency, currancyRateState: .same)
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
        }
        
        // MARK: SectionHeaders
        
        sectionHeaders = arrayOfWeeksInMonth
            .compactMap { header in
                CurrencyHistoryInfoDetailsSectionHeader(title: "Week " + String(header) )
            }
        
        // MARK: Sections
        
        sectionViewModels = arrayOfWeeksInMonth
            .enumerated()
            .compactMap { index, numberOfWeek in
                if numberOfWeek != 0 {
                    let itemInSection = cellViewModels.filter {item in
                        return item.getNumberOfWeekInMonth == numberOfWeek
                    }
                    return CurrencyHistoryInfoDetailsSectionViewModel(header: sectionHeader(at: index),
                                                                      items:  itemInSection,
                                                                      amountOfItemsInSection: itemInSection.count,
                                                                      isFirst: index == 0)
                }
                else {
                    let sectionHeader = sectionHeader(at: index)
                    sectionHeader.title = "Previous month"
                    return CurrencyHistoryInfoDetailsSectionViewModel(header: sectionHeader,
                                                                      items:  previousMonthCellViewModels,
                                                                      amountOfItemsInSection: previousMonthCellViewModels.count,
                                                                      isFirst: index == 0)
                }
            }
        willReload?()
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
        sectionViewModels[indexPath.section].items[indexPath.item]
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
        if !self.section(at: section).isFirst
        {
            willReloadSection?(section)
        }
    }
}
