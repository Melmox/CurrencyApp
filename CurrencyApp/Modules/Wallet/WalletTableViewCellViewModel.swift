//
//  WalletTableViewCellViewModel.swift
//  CurrencyApp
//
//  Created by developer_tmp on 21.03.2023.
//

import Foundation

final class WalletTableViewCellViewModel: BasicControllerUITableViewCell{
    func prepareForReuse() {
//        <#code#>
    }
    
    func awakeFromNib() {
//        <#code#>
    }
    
    func initView() {
//        <#code#>
    }
    
    
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
        
    //    private var header: WalletHeaderViewModel()
    private lazy var items: [WalletCellViewModel] = {
        for i in 0...codeOfMoney.count - 1{
            items.append(WalletCellViewModel(currencyAndAmount: [codeOfMoney[i]:amountOfMoney[i]]))
        }
        return items
    }()
    
    
    
    //MARK: - Init
    

    
    //MARK: - Appearance
    

    
    //MARK: - Provider
    
    var numberOfItems: Int {
        items.count
    }
    
    func item(at indexPath: IndexPath) -> WalletCellViewModel {
        items[indexPath.row]
    }
    
    
    
    //MARK: - Navigation
    
    
}
