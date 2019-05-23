//
//  closeView.swift
//  VK Market
//
//  Created by Lesha on 20/05/2019.
//  Copyright © 2019 y7c4k. All rights reserved.
//

import Foundation
import UIKit

class closeView : UIViewController {
    
    
    var imageURL : String!
    
    @IBAction func goBack(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UIImage.downloadImage(with: imageURL, nil) {
            image in
            DispatchQueue.main.async {
                self.imageView?.image = image
            }
        }
        
    }
}
