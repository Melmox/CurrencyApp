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
    
    private weak var coordinator: MainFlowCoordinator?
    private weak var service: UserService?
    var user: User?
    
    lazy var cellViewModels: [WalletSettingsTableCellViewModel] = []
    
    //MARK: Callbacks
    
    var willReload: emptyClosure?
    
    var openWebView: emptyClosure?
    
    var updateUserClosure: emptyClosure?
    
    
    //MARK: - Init
    
    init(coordinator: MainFlowCoordinator, service: UserService) {
        self.coordinator = coordinator
        self.service = service
    }
    
    //MARK: - Appearance
    
    func configure() {
        user = service?.user
        cellViewModels.append(WalletSettingsTableCellViewModel(type: .deleteAcount))
        cellViewModels.append(WalletSettingsTableCellViewModel(type: .logOut))
    }
    
    private func processItemSeletion(for itemType: WalletSettingsTableCellType) {
        switch itemType {
        case .deleteAcount:
            deleteAccount()
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
        coordinator?.presentWebViewController()
    }
    
    func deleteAccount() {
        service?.deleteAccount()
        coordinator?.launchAppCoordinator()
    }
    
    func updateUser(with user: User) {
        service?.updateUser(user: user)
    }
    
    //MARK: - Navigation
    
    func logOut() {
        service?.signOut()
        coordinator?.launchAppCoordinator()
    }
    
    func presentWebView() {
        coordinator?.presentWebViewController()
    }
}
