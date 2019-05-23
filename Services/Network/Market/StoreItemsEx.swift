//
//  getItemExtended.swift
//  VK Market
//
//  Created by Lesha on 18/05/2019.
//  Copyright © 2019 y7c4k. All rights reserved.
//

import Foundation

public struct StoreItemsEx: Codable {
    let count: Int
    let items: [StoreItemEx]
    
    init() {
        count = 0
        items = [StoreItemEx]()
    }
}

struct StoreItemEx: Codable {
    let id, ownerID: Int
    let title, description: String
    let price: Price
    let category: Category
    let date: Int
    let thumbPhoto: String
    let availability: Int
    let albumsIDS: [Int]
    let photos: [Photo]
    let canComment, canRepost: Int
    let likes: Likes
    let viewsCount: Int
    
    enum CodingKeys: String, CodingKey {
        case id
        case ownerID = "owner_id"
        case title, description, price, category, date
        case thumbPhoto = "thumb_photo"
        case availability
        case albumsIDS = "albums_ids"
        case photos
        case canComment = "can_comment"
        case canRepost = "can_repost"
        case likes
        case viewsCount = "views_count"
    }
}
