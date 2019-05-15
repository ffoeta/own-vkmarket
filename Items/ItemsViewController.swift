//
//  ViewController.swift
//  VK Market
//
//  Created by Lesha on 13/05/2019.
//  Copyright © 2019 y7c4k. All rights reserved.
//

import UIKit

class ItemsViewController: UIViewController {

    let marketService : MarketService = MarketService() //Сервис для управления магазинами
    let serverService : ServerService = ServerService() //Сервис для управления сервером
    @IBOutlet weak var collectionView: UICollectionView!
    
    var storeID : String!
    var storeItems : StoreItems = StoreItems()
    
    var offset = 0
    let valuesToDisplay = 16
    
    let ItemCache = NSCache<NSString, UIImage>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        
        self.load()
        
        self.collectionView.register(UINib(nibName: "ItemCell", bundle: nil), forCellWithReuseIdentifier: "ItemCell")
    }
}

extension ItemsViewController : UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let board:UIStoryboard = UIStoryboard(name: "Item", bundle: nil)
        let vc = board.instantiateViewController(withIdentifier: "ItemVIewController") as! ItemViewController
        
        vc.title            = storeItems.items[indexPath.row].title
        UIImage.downloadImage(with: storeItems.items[indexPath.row].thumbPhoto, ItemCache) {
            image in
            vc.itemImage    = image
        }
        vc.itemId           = "\(storeItems.items[indexPath.row].id)"
        vc.itemStoreId      = "\(storeItems.items[indexPath.row].ownerID)"
        vc.itemPrice        = storeItems.items[indexPath.row].price.text
        vc.itemStock        = String(storeItems.items[indexPath.row].availability)
        self.navigationController?.pushViewController(vc, animated: true)
    }
}


extension ItemsViewController : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.storeItems.items.count;
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ItemCell", for: indexPath) as! ItemCell
        
        UIImage.downloadImage(with: self.storeItems.items[indexPath.row].thumbPhoto, self.ItemCache) {
            image in
            DispatchQueue.main.async {
                cell.imageView?.image = image
                cell.nameLabel?.text = self.storeItems.items[indexPath.row].title
                cell.priceLabel?.text = String(self.storeItems.items[indexPath.row].price.text)
            }
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return !collectionView.isDragging && !collectionView.isTracking
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if (indexPath.row == storeItems.items.count - 1) {
            load()
        }
    }
}

extension ItemsViewController {
    func load() {
        if (storeItems.count != 0) && (storeItems.items.count == storeItems.count) {
            return
        }
        self.marketService.getItems(groupId: self.storeID, count: self.valuesToDisplay, offset: self.offset) { storeData in
            self.storeItems.items.append(contentsOf: storeData.items)
            self.storeItems.count = storeData.count
            self.offset += self.valuesToDisplay
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }
}
