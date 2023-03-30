//
//  CurrencyHistoryInfoDetailsSectionViewModel.swift
//  CurrencyApp
//
//  Created by developer_tmp on 29.03.2023.
//

import Foundation

final class CurrencyHistoryInfoDetailsSectionViewModel {
    
    // MARK: - Properties
    // MARK: Content
    
    var title: String
    var isShowed: Bool

    
    //MARK: - Initialization

    init(title: String, isShowed: Bool) {
        self.title = title
        self.isShowed = isShowed
    }
    
    //MARK: - Appearance
    
    func updateSelectedState() {
        isShowed.toggle()
    }
}
