//
//  WalletCollectionViewCellViewModel.swift
//  CurrencyApp
//
//  Created by developer_tmp on 17.03.2023.
//

import Foundation

final class WalletCollectionViewCellViewModel: BasicControllerCollectionViewItemModel{
    //MARK: - Properties
    //MARK: Fakedata
    
//    let data = ApiDescriptor().descriptApi()
    
    
    private let codeOfMoney : [CurrencyName] = [CurrencyName(currencyName: "UAH"),
                                                CurrencyName(currencyName: "USD"),
                                                CurrencyName(currencyName: "EUR"),
                                                CurrencyName(currencyName: "PLN")]
    private let amountOfMoney : [AmountOfMoney] = [AmountOfMoney(amountOfMoney: 10000.35),
                                                   AmountOfMoney(amountOfMoney: 2344),
                                                   AmountOfMoney(amountOfMoney: 32),
                                                   AmountOfMoney(amountOfMoney: 25.7)]
    
    //MARK: Content
    
//    private weak var interfaceCoordinator: Coordinator?
    
    //    private var header: WalletHeaderViewModel()
    private var items: [WalletCellViewModel] = []
    
    
    
    //MARK: - Init
    
    //    init(coordinator: Coordinator) {
    //        interfaceCoordinator = coordinator
    //    }
    
    //MARK: - Appearance
    
    func configure() {
        for i in 0...codeOfMoney.count - 1{
            items.append(WalletCellViewModel(currencyAndAmount: [codeOfMoney[i] : amountOfMoney[i]]))
        }
                
    }
    
    //    private func configureItems(with someData: SomeDAta) {
    //
    //    }
    
    //MARK: - Provider
    
    var getNumberOfItems: Int {
        items.count
    }
    
    func getItem(at indexPath: IndexPath) -> WalletCellViewModel {
        items[indexPath.row]
    }
    
    func getItems() -> [WalletCellViewModel] {
        configure()
        return items
    }
    
    
    
    //MARK: - Navigation
    
    
}
