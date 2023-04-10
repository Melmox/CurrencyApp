////
////  FakeData.swift
////  CurrencyApp
////
////  Created by developer_tmp on 17.03.2023.
////
//
//import Foundation
//
//
//struct CurrencyName: Hashable {
//    let currencyName: String
//    
//    init(currencyName: String) {
//        self.currencyName = currencyName
//    }
//}
//
//struct AmountOfMoney {
//    let amountOfMoney: Double
//    
//    init(amountOfMoney: Double) {
//        self.amountOfMoney = amountOfMoney
//    }
//}
//
//final class WalletHeaderViewModel {}
//
//final class WalletCellViewModel {
//    let currencyAndAmount: [CurrencyName : AmountOfMoney]
//    private var cardNumber: String!
//    var _cardNumber: String {
//        var creditCardNumber = "4441"
//        var counterToDoSpaces = 0
//        repeat {
//            if counterToDoSpaces == 0 || counterToDoSpaces == 4
//            {
//                creditCardNumber += "  "
//                counterToDoSpaces = 0
//            }
//            creditCardNumber += String(Int.random(in: 0..<10))
//            counterToDoSpaces += 1
//        }
//        while creditCardNumber.count < 16 + 6
//                return creditCardNumber
//    }
//    
//    init(currencyAndAmount: [CurrencyName : AmountOfMoney]) {
//        self.currencyAndAmount = currencyAndAmount
//        self.cardNumber = _cardNumber
//    }
//}

