//
//  inc.swift
//  VK Market
//
//  Created by Lesha on 13/05/2019.
//  Copyright © 2019 y7c4k. All rights reserved.
//

import Foundation
import Alamofire


extension ServerService {
    func inc(parameters param : String) {
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
