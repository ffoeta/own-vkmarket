//
//  getGroups.swift
//  VK Market
//
//  Created by Lesha on 13/05/2019.
//  Copyright © 2019 y7c4k. All rights reserved.
//

import Foundation
import Alamofire


extension ServerService {
    func getGroups(_ completionHandler: @escaping ((ServerGroups) -> Void)) {
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
}
