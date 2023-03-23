//
//  Networking.swift
//  CurrencyApp
//
//  Created by developer_tmp on 13.03.2023.
//

import Foundation
import Alamofire

//MARK: - Request data from API

private let apiKey = "3dff8c75da9d399819589f515422fde1"

func getData(endpoint: String, baseCurrency: String, date: String? = nil) {
    
    let url = "https://api.currencybeacon.com/v1/\(endpoint)"
    
    var parameters: Parameters = [
        "api_key": apiKey,
        "base": baseCurrency
        ]
    if date != nil{
        parameters.updateValue(date!, forKey: "date")
    }
        AF.request(url, parameters: parameters).responseData { response in

        switch response.result {
            case .success(let data): print(ApiDescriptor().decodeJSON(data))
        case .failure(_): break
            }
    }
}
