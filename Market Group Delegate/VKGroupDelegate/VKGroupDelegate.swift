//
//  VKGroupDelegate.swift
//  VK Market
//
//  Created by Lesha on 20/05/2019.
//  Copyright © 2019 y7c4k. All rights reserved.
//

import Foundation



public protocol VKGroupDelegate {
    func groupsGetByIdWrapper( groupIds : ServerGroups, _ completionHandler: @escaping (([Group]) -> Void))
    func groupsGetByIdWrapper( groupIds : String, _ completionHandler: @escaping (([Group]) -> Void))
}
