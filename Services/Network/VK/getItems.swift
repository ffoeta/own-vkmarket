//
//  getStoreItems.swift
//  VK Market
//
//  Created by Lesha on 11/05/2019.
//  Copyright © 2019 y7c4k. All rights reserved.
//

import Foundation
import SwiftyVK

extension MarketService {
    
    //Получаем все вещи из магазина
    
    func getItems( groupId ownerId  : String,
                        //albumId : String,
                        count       : Int,
                        offset      : Int,
                        //fields :
                        //versionID: String,
                        _ completionHandler: @escaping ((StoreItems) -> Void)) {
        
        let Parameters = [  Parameter.ownerId   :   "-"+ownerId,
                            //Parameter.albumId   :   "0",
                            Parameter.count     : String(count),
                            Parameter.offset    : String(offset),
                            //Parameter.fields    :   fields,
                            Parameter.versionId :  DEFAULT_VERSION_]
        
        VK.API.Market.get(Parameters)
            .onSuccess {
                print("Recieved",$0)
                if let result = try? JSONDecoder().decode(StoreItems.self, from: $0) {
                    print("Market Service \nItems successfuly recieved from Vk API.")
                    completionHandler(result)
                } else {
                    print("Market Service \nFailed to parse StoreItems.")
                }
            } .onError {
                print("Market Service \nError:\n",$0)
            } .send();
    }

}
