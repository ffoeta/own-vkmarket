//
//  HerokuServer.swift
//  VK Market
//
//  Created by Lesha on 20/05/2019.
//  Copyright © 2019 y7c4k. All rights reserved.
//

import Foundation

public protocol HerokuServerDelegate {
    
    //recieve group list from server
    func getGroups(parameters param : [String:String], _ completionHandler: @escaping ((ServerGroups) -> Void))
    
    //inc groups stats
    func inc(parameters param : [String:String]) 
}
