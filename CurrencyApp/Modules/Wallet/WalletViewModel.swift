//
//  WalletViewModel.swift
//  CurrencyApp
//
//  Created by developer_tmp on 16.03.2023.
//

import Foundation

final class WalletViewModel: BasicControllerViewModel {
    
    //MARK: - Properties
    var data : ExchangeRatesLatest = ExchangeRatesLatest(success: false, base: "", date: "", rates: ["" : 0])

    
    //MARK: Content
    
    private weak var interfaceCoordinator: Coordinator?

    
    //MARK: - Init
    
    init(coordinator: Coordinator) {
        interfaceCoordinator = coordinator
    }
    
    //MARK: - Appearance
    
    func configure() {
        getData(endpoint: ExchangeRatesLatest.self, baseCurrency: "UAH"){
            arr in
//            print(arr ?? 0)
            self.data = arr ?? ExchangeRatesLatest(success: false, base: "", date: "", rates: ["" : 0])
        }
        //        configureHeader()
        //        configureItems()
    }
    
//    private func configureHeader(with moneyArray: [String], amounts: [Double]) {
//        header = WalletHeaderViewModel(asdhgfashgdf: String....)
//    }
    
    //    private func configureItems(with someData: SomeDAta) {
    //
    //    }
    
    //MARK: - Provider
    
    func prepareString() -> [String]{
        var preparedStrings : [String] = []
        for (key, value) in data.prepareForBaseCurrencyRate() {
            preparedStrings.append("Per 1 \(key) you can buy \(Double(round(100 * value) / 100)) \(someTestData.base)")
        }
        return preparedStrings
    }
    
//    var prepareString  = {
//                var preparedStrings : [String] = []
//                for (key, value) in someTestData.prepareForBaseCurrencyRate() {
//                    preparedStrings.append("Per 1 \(key) you can buy \(Double(round(100 * value) / 100)) \(someTestData.base)")
//                }
//                return preparedStrings
//    }()
    
    var numberOfItems: Int {
        data.rates.count
    }
    
    //MARK: - Navigation
    
    
}
