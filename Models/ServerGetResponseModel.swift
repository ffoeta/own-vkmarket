////
////  ServerGetResponseModel.swift
////  VK Market
////
////  Created by Lesha on 23/03/2019.
////  Copyright © 2019 y7c4k. All rights reserved.
////
//
//import Foundation
//
////Отправляя запрос, мы получаем отвев в виде JSON, который по сути длинная строка. Мы хотим запарсить его в некоторую структуру, которой сможем удобно полтзоваться. Для этого нам нужны структуры для ответов
//
////В эту структуру мы кладем ответ, который нам даст запрос getShops (см ServerService)
//
//struct ServerGetResponseModel : Codable {
//    init() {
//        count = 0;
//        groups = [];
//    }
//    let count: Int
//    let groups: [Group]
//}
//
