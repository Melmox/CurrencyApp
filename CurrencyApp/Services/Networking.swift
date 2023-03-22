//
//  Networking.swift
//  CurrencyApp
//
//  Created by developer_tmp on 13.03.2023.
//

import Foundation
import Alamofire

let apiKey = "3dff8c75da9d399819589f515422fde1"



//func getDataFromAPI(completion: @escaping ([String:Any]?, Error?) -> Void) {
//    AF.request("https://api.currencybeacon.com/v1/historical?api_key=\(apiKey)&date=2020-01-05&base=UAH").responseJSON { response in
//        switch response.result {
//        case .success(let data):
//            completion(data as? [String:Any], nil)
//        case .failure(let error):
//            completion(nil, error)
//        }
//    }
//}


func getData(){
    AF.request("https://api.currencybeacon.com/v1/historical?api_key=\(apiKey)&date=2020-01-05&base=UAH").responseData { response in
        switch response.result {
            case .success(let data):
                do {
                    let asJSON = try JSONSerialization.jsonObject(with: data)
                    print(asJSON)
                } catch {
                    print("Error while decoding response: \(error) from: \(String(describing: String(data: data, encoding: .utf8)))")
                }
        case .failure(_): break
            }
    }
}
