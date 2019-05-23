//
//  Photo.swift
//  VK Market
//
//  Created by Lesha on 18/05/2019.
//  Copyright © 2019 y7c4k. All rights reserved.
//

import Foundation

struct Photo: Codable {
    let id, albumID, ownerID, userID: Int
    let sizes: [Size]
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

