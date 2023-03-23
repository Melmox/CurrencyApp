//
//  ApiDescriptor.swift
//  CurrencyApp
//
//  Created by developer_tmp on 22.03.2023.
//

import Foundation

//MARK: - Decoding of data from API

final class ApiDescriptor {
    var decodeJSON = { (jsonData: Data) -> ExchangeRates in
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(ApiResponseStructure.self, from: jsonData)
            let response = decodedData.response
//            WalletViewModel().someClosureToTakeArray(response)
//            print(response)
            return response
        } catch {
            print(error)
        }
        return ExchangeRates(date: "", base: "", rates: ["" : 0])
    }
}

