//
//  ServerService.swift
//  VK Market
//
//  Created by Lesha on 10/04/2019.
//  Copyright © 2019 y7c4k. All rights reserved.
//

import Foundation
import Alamofire


var serverDelegateReference : HerokuServerDelegate?

final class ServerDelegate : HerokuServerDelegate {
    
    init() {
        print("Server Delegte Loaded")
    }
    
    func getGroups(parameters param : [String:String], _ completionHandler: @escaping ((ServerGroups) -> Void)){
        Alamofire.request(DEFAULT_GROUP_URL_, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil).responseData { response in
            switch response.result {
            case .success(let data) :
                if let result = try? JSONDecoder().decode(ServerGroups.self, from: data) {
                    print("Server Delegate \nShop list successfuly recieved from server.")
                    completionHandler(result)
                } else {
                    print("Server Delegate \nFailed to parse.")
                }
            case .failure(let error) :
                print("Server Delegate \nError \n",error)
            }
        }
    }
    
    
    func inc(parameters param : [String:String]) {
        Alamofire.request("https://vk-market-server.herokuapp.com/groups/", method: .put, parameters: ["groupID" : param], encoding: JSONEncoding.default, headers: nil).responseData {
            response in
            switch response.result {
            case .success(let data) :
                print("Server Delegate \nSucess \n",data)
            case .failure(let error) :
                print("Server Delegate \nError \n",error)
            }
        }
    }
}
