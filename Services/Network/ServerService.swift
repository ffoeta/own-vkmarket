//
//  ServerService.swift
//  VK Market
//
//  Created by Lesha on 23/03/2019.
//  Copyright © 2019 y7c4k. All rights reserved.
//

import Foundation
import Alamofire

// Здесь лежит класс, который умеет отправлять запросы на сервер, который нам напишет саня. На данный момент они не работают

class ServerService {
    func getShops(_ completionHandler: @escaping ((MarketGetByIdResponseModel) -> Void)) {
        request("http://data.fixer.io/api/latest?access_key=ea50066730ed2d2d16a9d0d8182d7dbb").responseData {
            switch $0.result {
            case let .success(data):
                print("Recieved data from server. Loading...")
                print(data.hashValue)
            case let .failure(error):
                print("Error: \(error)")
            }
        }
    }
    
    //Пока не нужно, потом потребуется для статистики
    
    func incShopScoreById(parameters param : Int) {
        request("http://data.fixer.io/api/latest?access_key=ea50066730ed2d2d16a9d0d8182d7dbb").responseData {
            switch $0.result {
            case let .success(data):
                print("Recieved data from server. Loading...")
                print(data.hashValue)
            case let .failure(error):
                print("Error: \(error)")
            }
        }
    }
    
}
