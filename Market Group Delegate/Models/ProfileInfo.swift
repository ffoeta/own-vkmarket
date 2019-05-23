//
//  ProfileInfo.swift
//  VK Market
//
//  Created by Lesha on 16/05/2019.
//  Copyright © 2019 y7c4k. All rights reserved.
//

import Foundation

public struct ProfileInfoElement: Codable {
    let id: Int
    let lastName: String
    let isClosed, canAccessClosed: Bool
    let firstName: String
    let photo200: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case lastName = "last_name"
        case isClosed = "is_closed"
        case canAccessClosed = "can_access_closed"
        case firstName = "first_name"
        case photo200 = "photo_200"
    }
}

typealias ProfileInfo = [ProfileInfoElement]


