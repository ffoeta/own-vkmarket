//
//  RealmItem.swift
//  VK Market
//
//  Created by Lesha on 15/05/2019.
//  Copyright © 2019 y7c4k. All rights reserved.
//

import Foundation
import RealmSwift

class RealmItem : Object {
    @objc dynamic var id : String?
    @objc dynamic var ownerId : String?
}
