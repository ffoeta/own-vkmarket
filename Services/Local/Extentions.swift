//
//  Extentions.swift
//  VK Market
//
//  Created by Lesha on 30/04/2019.
//  Copyright © 2019 y7c4k. All rights reserved.
//

import Foundation
import UIKit

extension UIImageView {
    static func getImageAtPosWithSize(x: Int, y: Int, size: Int) -> UIImageView {
        let theImageView = UIImageView()
        theImageView.backgroundColor = UIColor.red
        theImageView.image = UIImage(named: "image.png")
        theImageView.frame = CGRect(x: x, y: y, width: size, height: size)
        //theImageView.translatesAutoresizingMaskIntoConstraints = false //You need to call this property so the image is added to your view
        return theImageView
    }
}
