//
//  ImageService.swift
//  VK Market
//
//  Created by Lesha on 23/03/2019.
//  Copyright © 2019 y7c4k. All rights reserved.
//

import Foundation
import UIKit

//Скачивает по ссылке и устанавливаем на iview

func downloadImage(with url : URL, imageView iview : UIImageView) {
    URLSession.shared.dataTask(with: url) { (data, response, error) in
        if (error) != nil {
            print("Error while downloadign from ",url)
            return
        }
        
        print("Changing Image...")
        
        DispatchQueue.main.async {
            iview.image = UIImage.init(data: data!)
            print("Image Changed.")
        }
        }.resume()
}
