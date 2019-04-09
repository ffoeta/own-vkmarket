//
//  MarketGetResponseByIdModel.swift
//  VK Market
//
//  Created by Lesha on 23/03/2019.
//  Copyright © 2019 y7c4k. All rights reserved.
//

import Foundation

////Отправляя запрос, мы получаем отвев в виде JSON, который по сути длинная строка. Мы хотим запарсить его в некоторую структуру, которой сможем удобно полтзоваться. Для этого нам нужны структуры для ответов

////В эту структуру мы кладем ответ, который нам даст запрос getById (см MarketService)

struct StoreItemsById: Codable {
    let count: Int
    let items: [StoreItemById]
}

struct StoreItemById: Codable {
    let id, ownerID: Int
    let title, description: String
    let price: PriceById
    let category: CategoryById
    let date: Int
    let thumbPhoto: String
    let availability: Int
    let isFavorite: Bool
    let albumsIDS: [Int]
    let photos: [PhotoById]
    let canComment, canRepost: Int
    let likes: LikesById
    let viewsCount: Int
    
    enum CodingKeys: String, CodingKey {
        case id
        case ownerID = "owner_id"
        case title, description, price, category, date
        case thumbPhoto = "thumb_photo"
        case availability
        case isFavorite = "is_favorite"
        case albumsIDS = "albums_ids"
        case photos
        case canComment = "can_comment"
        case canRepost = "can_repost"
        case likes
        case viewsCount = "views_count"
    }
}

struct CategoryById: Codable {
    let id: Int
    let name: String
    let section: SectionById
}

struct SectionById: Codable {
    let id: Int
    let name: String
}

struct LikesById: Codable {
    let userLikes, count: Int
    
    enum CodingKeys: String, CodingKey {
        case userLikes = "user_likes"
        case count
    }
}

struct PhotoById: Codable {
    let id, albumID, ownerID, userID: Int
    let sizes: [SizeById]
    let text: String
    let date: Int
    
    enum CodingKeys: String, CodingKey {
        case id
        case albumID = "album_id"
        case ownerID = "owner_id"
        case userID = "user_id"
        case sizes, text, date
    }
}

struct SizeById: Codable {
    let type: String
    let url: String
    let width, height: Int
}

struct PriceById: Codable {
    let amount: String
    let currency: SectionById
    let text: String
}
