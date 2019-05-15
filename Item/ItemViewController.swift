//
//  ItemViewController.swift
//  VK Market
//
//  Created by Lesha on 13/05/2019.
//  Copyright © 2019 y7c4k. All rights reserved.
//

import UIKit
import RealmSwift

class ItemViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    var itemId    : String!
    var itemStoreId   : String!
    var itemImage : UIImage!
    var itemPrice : String!
    var itemStock : String!
    
    @IBAction func addToFavorites(_ sender: Any) {
        let realm = try! Realm()
        
        let realmItem = RealmItem()
        realmItem.id        = itemId
        realmItem.ownerId   = itemStoreId
        
        try! realm.write {
            realm.add(realmItem)
        }
        
        showToast(message: "Добавлено")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.imageView?.image = itemImage

    }
}
