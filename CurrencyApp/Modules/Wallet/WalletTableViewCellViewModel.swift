//
//  WalletTableViewCellViewModel.swift
//  CurrencyApp
//
//  Created by developer_tmp on 21.03.2023.
//

import Foundation

final class WalletTableViewCellViewModel: BasicControllerUITableViewCell{
    //MARK: - Properties
    //MARK: Fakedata
    
    private let codeOfMoney : [CurrencyName] = [CurrencyName(currencyName: "UAH"),
                                                CurrencyName(currencyName: "USD"),
                                                CurrencyName(currencyName: "EUR"),
                                                CurrencyName(currencyName: "PLN")]
    private let amountOfMoney : [AmountOfMoney] = [AmountOfMoney(amountOfMoney: 10000.35),
                                                   AmountOfMoney(amountOfMoney: 2344),
                                                   AmountOfMoney(amountOfMoney: 32),
                                                   AmountOfMoney(amountOfMoney: 25.7)]
    
    //MARK: Content
    
    private weak var interfaceCoordinator: Coordinator?
    
    //    private var header: WalletHeaderViewModel()
    private lazy var items: [WalletCellViewModel] = {
        for i in 0...codeOfMoney.count - 1{
            items.append(WalletCellViewModel(currencyAndAmount: [codeOfMoney[i]:amountOfMoney[i]]))
        }
        return items
    }()
    
    
    
    //MARK: - Init
    
    init(coordinator: Coordinator) {
        interfaceCoordinator = coordinator
    }
    
    //MARK: - Appearance
    
    func configure() {
        //        let someData = getSomeFakeData()
        
        //        configureHeader()
        //        configureItems()
    }
    
    //    private func configureItems(with someData: SomeDAta) {
    //
    //    }
    
    //MARK: - Provider
    
    var numberOfItems: Int {
        items.count
    }
    
    func item(at indexPath: IndexPath) -> WalletCellViewModel {
        items[indexPath.row]
    }
    
    
    
    //MARK: - Navigation
    
    
}
