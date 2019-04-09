//
//  JSONReplacer.swift
//  VK Market
//
//  Created by Lesha on 09/04/2019.
//  Copyright © 2019 y7c4k. All rights reserved.
//

import Foundation

func jSONReplaceNull(_ data: Data) -> Data {
    let str = String(data: data, encoding: .utf8)!.replacingOccurrences(of: "null", with: "\"none\"")
    if let result = str.data(using: .utf8) {
        return result
    } else {
        return data
    }
}
