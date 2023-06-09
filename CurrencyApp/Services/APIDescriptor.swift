//
//  APIDescriptor.swift
//  CurrencyApp
//
//  Created by developer_tmp on 22.03.2023.
//

import Foundation

final class APIDescriptor {
    func decodeJSON<T: Decodable>(type: T.Type, jsonData: Data) -> T? {
        let decoder = JSONDecoder()
            do {
                let decodedData = try decoder.decode(type, from: jsonData)
                return decodedData
            } catch {
                print(error)
            }
        return nil
    }
}

