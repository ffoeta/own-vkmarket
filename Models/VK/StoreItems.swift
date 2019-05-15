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

struct StoreItems: Codable {
    var count: Int
    var items: [StoreItem]
    
    init() {
        count = 0
        items = [StoreItem]()
    }

}


struct StoreItem: Codable {
    let id, ownerID: Int
    let title, description: String
    let price: Price
    let category: Category
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

struct Category: Codable {
    let id: Int
    let name: String
    let section: Section
}

struct Section: Codable {
    let id: Int
    let name: String
}

struct Price: Codable {
    let amount: String
    let currency: Section
    let text: String
}
