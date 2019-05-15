//
//  ItemViewController.swift
//  VK Market
//
//  Created by Lesha on 13/05/2019.
//  Copyright © 2019 y7c4k. All rights reserved.
//

import UIKit

class ItemViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    var itemImage : UIImage!
    var itemPrice : String!
    var itemStock : String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.imageView?.image = itemImage

    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
