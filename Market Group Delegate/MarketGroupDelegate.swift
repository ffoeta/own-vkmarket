//
//  MarketDelegate.swift
//  VK Market
//
//  Created by Lesha on 20/05/2019.
//  Copyright © 2019 y7c4k. All rights reserved.
//

import Foundation
import RealmSwift
import SwiftyVK

public typealias VKMarketGrpoupDelegate = VKMarketDelegate & VKGroupDelegate

var marketGroupDelegateReference : VKMarketGrpoupDelegate?

final class MarketGroupDelegate : VKMarketGrpoupDelegate {
    
    init() {
        print("Market Group Delegate Loaded.")
    }
    
    func marketGetByIdWrapper( item_ids : Results<RealmItem>, _ completionHandler: @escaping ((StoreItems) -> Void)) {
        
        var itemsToString = ""
        
        for item in item_ids {
            itemsToString.append(item.ownerId!)
            itemsToString.append("_")
            itemsToString.append(item.id!)
            itemsToString.append(",")
        }
        
        let RawParameters = ["item_ids"  :   itemsToString,
                             "lang"      :   "en",
                             "extended"  :   "0",
                             "oauth"     :   "1",
                             "method"    :   "market.getById",
                             "v"         :   "5.92",
                             "https"     :   "1"]
        
        VK.API.Custom.method(name: "market.getById", parameters: RawParameters)
            .onSuccess {
                print("Recieved",$0)
                if let result = try? JSONDecoder().decode(StoreItems.self, from: $0) {
                    print("Market Service \nItem successfuly recieved from Vk API.")
                    completionHandler(result)
                } else {
                    print("Market Service \nFailed to parse StoreItemsById.")
                }
            }.onError{
                print("Market Service \nError:\n",$0)
            }.send();
    }
    
    func marketGetByIdExtendedWrapper( item_id : String, _ completionHandler: @escaping ((StoreItemsEx) -> Void)) {
        
        let RawParameters = ["item_ids"  :   item_id,
                             "lang"      :   "en",
                             "extended"  :   "1",
                             "oauth"     :   "1",
                             "method"    :   "market.getById",
                             "v"         :   "5.92",
                             "https"     :   "1"]
        
        VK.API.Custom.method(name: "market.getById", parameters: RawParameters)
            .onSuccess {
                print("Recieved",$0)
                if let result = try? JSONDecoder().decode(StoreItemsEx.self, from: $0) {
                    print("Market Service \nItem successfuly recieved from Vk API.")
                    completionHandler(result)
                } else {
                    print("Market Service \nFailed to parse StoreItemsById.")
                }
            }.onError{
                print("Market Service \nError:\n",$0)
            }.send();
    }
    
    func marketGetWrapper( groupId ownerId  : String, count : Int, offset : Int, _ completionHandler: @escaping ((StoreItems) -> Void)) {
        
        let Parameters = [  Parameter.ownerId   :   "-"+ownerId,
                            Parameter.count     : String(count),
                            Parameter.offset    : String(offset),
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
    
    func groupsGetByIdWrapper( groupIds : ServerGroups, _ completionHandler: @escaping (([Group]) -> Void)) {
        
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
    
    func groupsGetByIdWrapper( groupIds : String, _ completionHandler: @escaping (([Group]) -> Void)) {
        
        let Parameters = [Parameter.groupIds     :   groupIds,
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
