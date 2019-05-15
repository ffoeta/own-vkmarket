//
//  ProfileInfo.swift
//  VK Market
//
//  Created by Lesha on 16/05/2019.
//  Copyright © 2019 y7c4k. All rights reserved.
//

import Foundation

import Foundation

class ProfileInfo: Codable {
    let bdate, status: String
    let country: Country
    let phone, lastName, homeTown: String
    let bdateVisibility, relation: Int
    let screenName: String
    let sex: Int
    let firstName: String
    
    enum CodingKeys: String, CodingKey {
        case bdate, status, country, phone
        case lastName = "last_name"
        case homeTown = "home_town"
        case bdateVisibility = "bdate_visibility"
        case relation
        case screenName = "screen_name"
        case sex
        case firstName = "first_name"
    }
}

struct Country: Codable {
    let id: Int
    let title: String
}
