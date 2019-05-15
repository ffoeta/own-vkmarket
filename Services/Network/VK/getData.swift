//
//  getStoreData.swift
//  VK Market
//
//  Created by Lesha on 11/05/2019.
//  Copyright © 2019 y7c4k. All rights reserved.
//

import Foundation
import SwiftyVK

extension MarketService {
    
    //Получаем группу
    
    func getData( groupIds : ServerGroups, _ completionHandler: @escaping (([Group]) -> Void)) {
        
        var groupIdsToString = ""
        
        for item in groupIds.results {
            groupIdsToString.append(item.groupID)
            groupIdsToString.append(",")
        }
        
        let Parameters = [Parameter.groupIds     :   groupIdsToString,
                          Parameter.fields       :   DEFAULT_GROUP_FIELDS_,
                          Parameter.versionId    :   DEFAULT_VERSION_]
        
        VK.API.Groups.getById(Parameters)
            .onSuccess {
                print("Recieved",$0)
                if let result = try? JSONDecoder().decode([Group].self, from: $0) {
                    print("Market Service \nGroup successfuly recieved from Vk API.")
                    completionHandler(result)
                } else {
                    print("Market Service \nFailed to parse [GroupById].")
                }
            }.onError{
                print("Market Service \nError:\n",$0)
            }.send();
    }
    
}
