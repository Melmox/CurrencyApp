//
//  CurrencyHistoryInfoDetailsSectionViewModel.swift
//  CurrencyApp
//
//  Created by developer_tmp on 30.03.2023.
//

import Foundation

final class CurrencyHistoryInfoDetailsSectionViewModel {
    
    // MARK: - Properties
    // MARK: Content
    
    private lazy var amountOfItemsInSection = 0
    private lazy var header: CurrencyHistoryInfoDetailsSectionHeader = CurrencyHistoryInfoDetailsSectionHeader(title: "")
    private lazy var items: [CurrencyHistoryInfoDetailsSectionItem] = []
    
    // MARK: - Initialization
    
    init(header: CurrencyHistoryInfoDetailsSectionHeader, items: [CurrencyHistoryInfoDetailsSectionItem], amountOfItemsInSection: Int) {
        self.header = header
        self.items = items
        self.amountOfItemsInSection = amountOfItemsInSection
    }
    
    // MARK: - Appearance
    
    var numberOfItems: Int {
        header.isShowed ? amountOfItemsInSection : .zero
    }
}
