//
//  Extentions.swift
//  VK Market
//
//  Created by Lesha on 30/04/2019.
//  Copyright © 2019 y7c4k. All rights reserved.
//

import Foundation
import UIKit

extension UIImage {
    static func downloadImage(with stringAsUrl : String, _ cache : NSCache<NSString, UIImage>, _ completionHandler: @escaping ((UIImage) -> Void)) {
        let url = URL(string: stringAsUrl)
        
        if let imageFromCache = cache.object(forKey: NSString(string: stringAsUrl)) {
            completionHandler(imageFromCache)
            return
        }
        
        URLSession.shared.dataTask(with: url!) { (data, response, error) in
            if (error) != nil {
                print("Error while downloadign from ",url!)
                return
            }
            let imageToCache = UIImage.init(data: data!)
            completionHandler(imageToCache!)
            cache.setObject(imageToCache!, forKey: NSString(string: stringAsUrl))
        }.resume()
    }
}
