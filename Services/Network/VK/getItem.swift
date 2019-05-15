//
//  getStoreItem.swift
//  VK Market
//
//  Created by Lesha on 11/05/2019.
//  Copyright © 2019 y7c4k. All rights reserved.
//

import Foundation
import SwiftyVK

extension MarketService {
    
    //Получаем 1 предмет из магазина
    
    func getItem( item_ids : String, _ completionHandler: @escaping ((StoreItemsById) -> Void)) {
        
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
                if let result = try? JSONDecoder().decode(StoreItemsById.self, from: $0) {
                    print("Market Service \nItem successfuly recieved from Vk API.")
                    completionHandler(result)
                } else {
                    print("Market Service \nFailed to parse StoreItemsById.")
                }
            }.onError{
                print("Market Service \nError:\n",$0)
            }.send();
    }
    
    
}

