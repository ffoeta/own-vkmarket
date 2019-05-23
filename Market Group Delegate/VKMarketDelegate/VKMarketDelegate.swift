//
//  VKMarketDelegate.swift
//  VK Market
//
//  Created by Lesha on 20/05/2019.
//  Copyright © 2019 y7c4k. All rights reserved.
//

import Foundation
import RealmSwift

public protocol VKMarketDelegate {
    
    func marketGetByIdWrapper( item_ids : Results<RealmItem>, _ completionHandler: @escaping ((StoreItems) -> Void))
    func marketGetByIdExtendedWrapper( item_id : String, _ completionHandler: @escaping ((StoreItemsEx) -> Void))
    func marketGetWrapper( groupId ownerId  : String, count : Int, offset : Int, _ completionHandler: @escaping ((StoreItems) -> Void))
}
