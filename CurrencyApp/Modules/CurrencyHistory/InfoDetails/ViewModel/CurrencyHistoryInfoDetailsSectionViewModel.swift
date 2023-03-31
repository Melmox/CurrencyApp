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
    lazy var header: CurrencyHistoryInfoDetailsSectionHeader = CurrencyHistoryInfoDetailsSectionHeader(title: "")
    lazy var items: [CurrencyHistoryInfoDetailsSectionItem] = []
    
    lazy var isFirst: Bool = false
    
    // MARK: - Initialization
    
    init(header: CurrencyHistoryInfoDetailsSectionHeader, items: [CurrencyHistoryInfoDetailsSectionItem], amountOfItemsInSection: Int, isFirst: Bool) {
        self.header = header
        self.items = items
        self.amountOfItemsInSection = amountOfItemsInSection
        self.isFirst = isFirst
    }
    
    // MARK: - Appearance
    var numberOfItems: Int {
        if isFirst{
            header.title = ""
            return amountOfItemsInSection
        }
        else {
            return header.isShowed ? amountOfItemsInSection : .zero
        }
    }
}
