//
//  WalletSettingsViewModel.swift
//  CurrencyApp
//
//  Created by developer_tmp on 05.04.2023.
//

import Foundation

class WalletSettingsViewModel: BasicControllerViewModel {
    
    //MARK: - Properties
    //MARK: Content
    
    private weak var interfaceCoordinator: AppCoordinator?
    lazy var cellViewModels: [WalletSettingsTableCellViewModel] = []
    
    //MARK: Callbacks
    
    var willReload: (() -> ())?
    
    var openWebView: emptyClosure?
    
    
    //MARK: - Init
    
    init(coordinator: AppCoordinator) {
        interfaceCoordinator = coordinator
    }
    
    //MARK: - Appearance
    
    func configure() {
        cellViewModels.append(WalletSettingsTableCellViewModel(type: .deleteAcount))
        cellViewModels.append(WalletSettingsTableCellViewModel(type: .logOut))
    }
    
    private func processItemSeletion(for itemType: WalletSettingsTableCellType) {
        switch itemType {
        case .deleteAcount:
            print("Delete")
            
        case .logOut:
            logOut()
        }
    }

    //MARK: - Provider
    
    var numberOfItems: Int {
        cellViewModels.count
    }
    
    func item(at indexPath: IndexPath) -> WalletSettingsTableCellViewModel{
        return cellViewModels[indexPath.row]
    }
    
    func didSelectItem(at index: IndexPath) {
        let cellType = item(at: index).type
        processItemSeletion(for: cellType)
    }
        
    func footerTapped() {
            interfaceCoordinator?.mainCoordinator?.presentWebViewController()
    }
    
    //MARK: - Navigation
    
    func logOut() {
        interfaceCoordinator?.state = .notLogined
        interfaceCoordinator?.start()
    }
    
    
    
    
}
