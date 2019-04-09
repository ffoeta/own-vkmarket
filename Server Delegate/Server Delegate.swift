//
//  Server Delegate.swift
//  VK Market
//
//  Created by Lesha on 08/04/2019.
//  Copyright © 2019 y7c4k. All rights reserved.
//

import Foundation
import Alamofire

var serverDelegateReference : ServerDelegate?

final class ServerDelegate {
    func getShops(_ completionHandler: @escaping ((ServerGetResponseModel) -> Void)) {
        Alamofire.request("https://vk-market-server.herokuapp.com/groups", method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil).responseData { response in
                switch response.result {
                case .success(let data) :
                    if let result = try? JSONDecoder().decode(ServerGetResponseModel.self, from: data) {
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
    
    //Пока не нужно, потом потребуется для статистики
    
    func incShopScoreById(parameters param : String) {
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
