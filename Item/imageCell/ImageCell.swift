//
//  imageCell.swift
//  VK Market
//
//  Created by Lesha on 18/05/2019.
//  Copyright © 2019 y7c4k. All rights reserved.
//

import Foundation
import UIKit

class ImageCell: UICollectionViewCell {
    @IBOutlet weak var imageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        if imageView?.image == nil {
            
        }
    }
    
}
