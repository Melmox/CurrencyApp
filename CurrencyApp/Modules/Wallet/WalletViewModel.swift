//
//  WalletViewModel.swift
//  CurrencyApp
//
//  Created by developer_tmp on 16.03.2023.
//

import Foundation

final class WalletViewModel: BasicControllerViewModel {
    
    //MARK: - Properties
    //MARK: Fakedata
    
    var testData = someTestData
    
    var someClosureToTakeArray = {(exchangeRatesArr: ExchangeRates) in
        print(exchangeRatesArr)
    }
    
//    private let codeOfMoney : [CurrencyName] = [CurrencyName(currencyName: "UAH"),
//                                                CurrencyName(currencyName: "USD"),
//                                                CurrencyName(currencyName: "EUR"),
//                                                CurrencyName(currencyName: "PLN")]
//    private let amountOfMoney : [AmountOfMoney] = [AmountOfMoney(amountOfMoney: 10000.35),
//                                                   AmountOfMoney(amountOfMoney: 2344),
//                                                   AmountOfMoney(amountOfMoney: 32),
//                                                   AmountOfMoney(amountOfMoney: 25.7)]
    
    //MARK: Content
    
    private weak var interfaceCoordinator: Coordinator?
    
    //    private var header: WalletHeaderViewModel()
//    private lazy var items: [WalletCellViewModel] = {
//        for i in 0...codeOfMoney.count - 1{
//            items.append(WalletCellViewModel(currencyAndAmount: [codeOfMoney[i]:amountOfMoney[i]]))
//        }
//        return items
//    }()
    
    
    
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
    
    private func configureHeader(with moneyArray: [String], amounts: [Double]) {
        //header = WalletHeaderViewModel(asdhgfashgdf: String....)
    }
    
    //    private func configureItems(with someData: SomeDAta) {
    //
    //    }
    
    //MARK: - Provider
    
    
    var prepareString  = {
                var preparedStrings : [String] = []
                for (key, value) in someTestData.prepareForBaseCurrencyRate() {
                    preparedStrings.append("Per 1 \(key) you can buy \(Double(round(100 * value) / 100)) \(someTestData.base)")
                }
                return preparedStrings
    }()
    
    var numberOfItems: Int {
        testData.rates.count
    }
    
    
    
//    func item(at indexPath: IndexPath) -> [:] {
//        testData[indexPath.row]
//    }
    
    //MARK: - Navigation
    
    
}
