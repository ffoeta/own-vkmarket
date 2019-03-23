//
//  MarketService.swift
//  VK Market
//
//  Created by Lesha on 23/03/2019.
//  Copyright © 2019 y7c4k. All rights reserved.
//

import Foundation
import SwiftyVK

//Здесь лежит класс, котоырй умеет отправлять запросы через API вк. Получает на вход параметры, инициализует Parameters (так надо) и отправляет запрос, через колбаки обрабатываем success или error

class MarketService {
    func VKgetShopItems( ownerID  : String,
                       albumID : String,
                       count : String,
                       fields : String,
                       versionID: String
        , _ completionHandler: @escaping ((MarketGetByIdResponseModel) -> Void)) {
        
        let Parameters = [
            Parameter.ownerId : ownerID,
            Parameter.albumId : albumID,
            Parameter.count : count,
            Parameter.fields : fields,
            Parameter.versionId : versionID
        ]
        
        VK.API.Market.get(Parameters).onSuccess({
            print("Recieved",$0)
            if let result = try? JSONDecoder().decode(MarketGetByIdResponseModel.self, from: $0) {
                print("Request getShopItems from ",result.items[0].ownerID," suceeded")
                completionHandler(result)
            } else {
                print("Request getShopItems couldn't be decoded from JSON")
            }
        }).onError({
            print("Request getShopItems failed with error:\n")
            print($0)
        }).send();
    }
    
    func VKgetItemById( item_ids : String,
                      _ completionHandler: @escaping ((MarketGetByIdResponseModel) -> Void)) {
//        let Parameters = [
//            Parameter.itemId : item_ids //спасибо за недоделанный фреймворк
//        ]
        
        let RawParameters = [
            "item_ids": item_ids,
            "lang": "en",
            "extended" : "1",
            "oauth": "1",
            "method": "market.getById",
            "v": "5.92",
            "https": "1"]
        VK.API.Custom.method(name: "market.getById", parameters: RawParameters).onSuccess({
            print("Recieved",$0)
            if let result = try? JSONDecoder().decode(MarketGetByIdResponseModel.self, from: $0) {
                print("Request getItemById from ",result.items[0].ownerID," suceeded")
                completionHandler(result)
            } else {
                print("Request getItemById couldn't be decoded from JSON")
            }
        }).onError({
            print("Request getItemById failed with error:\n")
            print($0)
        }).send();
        
//        VK.API.Market.getById(Parameters).onSuccess({
//            if let result = try? JSONDecoder().decode(MarketGetResponseModel.self, from: $0) {
//                print("Request getItemById from ",result.count == 0," suceeded")
//                completionHandler(result)
//            } else {
//                print("Request getItemById returned empty")
//            }
//        }).onError({
//            print("Request getItemById failed with error:\n")
//            print($0)
//        }).send();
    }
    
}
