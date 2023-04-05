//
//  WalletSettingsTableCellViewModel.swift
//  CurrencyApp
//
//  Created by developer_tmp on 05.04.2023.
//

import Foundation

enum WalletSettingsTableCellType {
    case deleteAcount
    case logOut
    
    var title: String {
        switch self {
        case .deleteAcount:
            return "Delete account"
        case .logOut:
            return "Log out"
        }
    }
}

struct WalletSettingsTableCellViewModel {
    var type: WalletSettingsTableCellType
    
    var title: String {
        type.title
    }
}
