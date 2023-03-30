//
//  CurrencyHistoryInfoDetailsViewModel.swift
//  CurrencyApp
//
//  Created by developer_tmp on 22.03.2023.
//

import Foundation

class CurrencyHistoryInfoDetailsViewModel: BasicControllerViewModel {
    
    //MARK: - Properties
    
    let amountOfCellsInSection = [2, 3, 4]
    
    //MARK: Content
    
    private weak var interfaceCoordinator: Coordinator?
    //    lazy var cellViewModels: [CurrencyHistoryInfoDetailsCellViewModel] = [] //CurrencyHistoryInfoDetailsItem
    
    lazy var sectionViewModels: [CurrencyHistoryInfoDetailsSectionViewModel] = [] //CurrencyHistoryInfoDetailsSection
    //    lazy var items: [CurrencyHistoryInfoDetailsCellViewModel] = []
    
    
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
        sectionViewModels = amountOfCellsInSection
            .compactMap { header in
                CurrencyHistoryInfoDetailsSectionViewModel(title: String(header) + " days", isShowed: true)
            }
        willReload?()
    }
    
    //MARK: - Provider
    
    var numberOfSections: Int {
        sectionViewModels.count
    }
    
    func section(at section: Int) -> CurrencyHistoryInfoDetailsSectionViewModel {
        sectionViewModels[section]
    }
    
    func didSelectSection(at section: Int) {
        willReloadSection?(section)
    }
}
