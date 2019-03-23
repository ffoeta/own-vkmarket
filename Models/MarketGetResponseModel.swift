////
////  MarketGetResponseModel.swift
////  VK Market
////
////  Created by Lesha on 23/03/2019.
////  Copyright © 2019 y7c4k. All rights reserved.
////

import Foundation

////Отправляя запрос, мы получаем отвев в виде JSON, который по сути длинная строка. Мы хотим запарсить его в некоторую структуру, которой сможем удобно полтзоваться. Для этого нам нужны структуры для ответов

////В эту структуру мы кладем ответ, который нам даст запрос get (см MarketService)

struct MarketGetResponseModel: Codable {
    let count: Int
    let items: [ItemGetResponse]
}

struct ItemGetResponse: Codable {
    let id, ownerID: Int
    let title, description: String
    let price: PriceGetResponse
    let category: CategoryGetResponse
    let date: Int
    let thumbPhoto: String
    let availability: Int
    
    enum CodingKeys: String, CodingKey {
        case id
        case ownerID = "owner_id"
        case title, description, price, category, date
        case thumbPhoto = "thumb_photo"
        case availability
    }
}

struct CategoryGetResponse: Codable {
    let id: Int
    let name: String
    let section: SectionGetResponse
}

struct SectionGetResponse: Codable {
    let id: Int
    let name: String
}

struct PriceGetResponse: Codable {
    let amount: String
    let currency: SectionGetResponse
    let text: String
}
