//
//  AlamofireManager.swift
//  CurrencyApp
//
//  Created by developer_tmp on 13.03.2023.
//

import Foundation
import Alamofire

final class AlamofireManager {
        
    func getData<T: Codable>(
        endpoint: T.Type,
        baseCurrency: String,
        start_date: String? = nil,
        end_date: String? = nil,
        completion: @escaping (T?) -> Void) {
        
        var pathEndpoint = ""
        var parameters: Parameters = [
            "base": baseCurrency
        ]
        
        switch endpoint {
        case is ExchangeRatesLatest.Type:
            pathEndpoint = "latest"
            
        case is ExchangeRatesDateRange.Type:
            pathEndpoint = "timeseries"
            parameters.updateValue(start_date!, forKey: "start_date")
            parameters.updateValue(end_date!, forKey: "end_date")
            
        default:
            break
        }
        
        let url = "https://api.exchangerate.host/\(pathEndpoint)"
        AF.request(url, parameters: parameters).responseData { response in
            switch response.result {
            case .success(let data): completion(APIDescriptor().decodeJSON(type: endpoint, jsonData: data))
            case .failure(_): break
            }
        }
    }
    
}
