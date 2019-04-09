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
    
    
    //Получаем все вещи из магазина
    func VKgetShopItems( ownerID  : String,
                         albumID : String,
                         count : String,
                         fields : String,
                         versionID: String,
                         _ completionHandler: @escaping ((MarketGetByIdResponseModel) -> Void)) {
        
        
        let Parameters = [Parameter.ownerId   :   ownerID,
                          Parameter.albumId   :   albumID,
                          Parameter.count     :   count,
                          Parameter.fields    :   fields,
                          Parameter.versionId :   versionID]
        
        VK.API.Market.get(Parameters).onSuccess({
            print("Recieved",$0)
            if let result = try? JSONDecoder().decode(MarketGetByIdResponseModel.self, from: $0) {
                print("Market Service \nItems successfuly recieved from Vk API.")
                completionHandler(result)
            } else {
                print("Market Service \nFailed to parse.")
            }
        }).onError({
            print("Market Service \nError:\n",$0)
        }).send();
    }
    
    //Получаем 1 предмет из магазина
    func VKgetItemById( item_ids : String, _ completionHandler: @escaping ((MarketGetByIdResponseModel) -> Void)) {
        
        let RawParameters = ["item_ids"  :   item_ids,
                            "lang"      :   "en",
                            "extended"  :   "1",
                            "oauth"     :   "1",
                            "method"    :   "market.getById",
                            "v"         :   "5.92",
                            "https"     :   "1"]
        
        VK.API.Custom.method(name: "market.getById", parameters: RawParameters)
            .onSuccess {
                print("Recieved",$0)
                if let result = try? JSONDecoder().decode(MarketGetByIdResponseModel.self, from: $0) {
                    print("Market Service \nItem successfuly recieved from Vk API.")
                    completionHandler(result)
                } else {
                    print("Market Service \nFailed to parse.")
                }
            }.onError{
                print("Market Service \nError:\n",$0)
            }.send();
    }
    
    
    //Получаем группу
}
