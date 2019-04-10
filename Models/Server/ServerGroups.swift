//
//  ServerGetResponseModel.swift
//  VK Market
//
//  Created by Lesha on 23/03/2019.
//  Copyright © 2019 y7c4k. All rights reserved.
//

import Foundation

////Отправляя запрос, мы получаем отвев в виде JSON, который по сути длинная строка. Мы хотим запарсить его в некоторую структуру, которой сможем удобно полтзоваться. Для этого нам нужны структуры для ответов

////В эту структуру мы кладем ответ, который нам даст запрос getShops (см ServerService)
    
struct ServerGroups: Codable {
    
    init() {
        count = -1
        next = ""
        previous = ""
        results = [ServerResult]()
    }
    
    let count: Int
    let next, previous: String?
    let results: [ServerResult]
   
    enum CodingKeys: String, CodingKey {
        case count
        case next = "next"
        case previous = "previous"
        case results
    }
}
    
struct ServerResult: Codable {
    
    init() {
        groupID = ""
        rate = 0
    }
    
    let groupID: String
    let rate: Int
    
    enum CodingKeys: String, CodingKey {
        case groupID = "groupId"
        case rate
    }
}

//extension ServerGetResponseModel {
//    init(from decoder: Decoder) throws {
//        let values = try decoder.container(keyedBy: CodingKeys.self)
//        count = try values.decode(Int.self, forKey: .count)
//        next = try values.decode(String.self, forKey: .next)
//    }
//}
//
//extension ServerResultModel {
//    init(from decoder: Decoder) throws {
//        let values = try decoder.container(keyedBy: CodingKeys.self)
//        groupID = try values.decode(String.self, forKey: .groupID)
//        rate = try values.decode(Int.self, forKey: .rate)
//    }
//}
