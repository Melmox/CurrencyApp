//
//  CurrencyHistoryInfoDetailsCellViewModel.swift
//  CurrencyApp
//
//  Created by developer_tmp on 22.03.2023.
//

import Foundation

struct CurrencyHistoryInfoDetailsCellViewModel {
    let currencyExchangeCource: String
    let date: String
    var imageName: String
    
    mutating func setNewImageName(newImageName: String) {
        self.imageName = newImageName
    }
}
// Possible options of arrow type
//cell.arrowImage.image = UIImage(systemName: "arrow.up.right")!.withTintColor(.systemGreen, renderingMode: .alwaysOriginal)
//cell.arrowImage.image = UIImage(systemName: "arrow.down.right")!.withTintColor(.systemRed, renderingMode: .alwaysOriginal)
