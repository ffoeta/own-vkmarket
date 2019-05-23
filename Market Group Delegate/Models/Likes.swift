//
//  Likes.swift
//  VK Market
//
//  Created by Lesha on 18/05/2019.
//  Copyright © 2019 y7c4k. All rights reserved.
//

import Foundation

struct Likes: Codable {
    let userLikes, count: Int
    
    enum CodingKeys: String, CodingKey {
        case userLikes = "user_likes"
        case count
    }
}
