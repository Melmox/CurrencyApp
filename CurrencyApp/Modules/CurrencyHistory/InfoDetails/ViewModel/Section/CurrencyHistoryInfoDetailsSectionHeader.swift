//
//  CurrencyHistoryInfoDetailsSectionHeader.swift
//  CurrencyApp
//
//  Created by developer_tmp on 29.03.2023.
//

import Foundation

final class CurrencyHistoryInfoDetailsSectionHeader {
    
    // MARK: - Properties
    // MARK: Content
    
    var title: String
    private(set) var isShowed = false

    // MARK: - Initialization

    init(title: String) {
        self.title = title
    }
    
    // MARK: - Appearance
    
    func updateSelectedState() {
        isShowed.toggle()
    }
}
