//
//  FavoritesViewController.swift
//  VK Market
//
//  Created by Lesha on 13/05/2019.
//  Copyright © 2019 y7c4k. All rights reserved.
//

import Foundation
import UIKit
import RealmSwift

class FavoritesViewController: UIViewController {
    
    let ItemCache = NSCache<NSString, UIImage>()
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var favoritesRealm : Results<RealmItem>!
    var favorites   : StoreItems = StoreItems()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        
        self.collectionView.refreshControl = UIRefreshControl()
        self.collectionView.refreshControl!.tintColor = .black
        self.collectionView.refreshControl!.addTarget(self, action: #selector(load), for: .valueChanged)
        
        
        self.load()
        
        self.title = "Favorites"
    }
}

extension FavoritesViewController : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return favorites.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FavoriteCell", for: indexPath) as! FavoriteCell

        cell.titleLabel?.text           = self.favorites.items[indexPath.row].title        
        cell.configureAsFavoriteCell()
        
        UIImage.downloadImage(with: self.favorites.items[indexPath.row].thumbPhoto, self.ItemCache) {
            image in
            DispatchQueue.main.async {
                cell.imageView?.image        = image
            }
        }
        
        return cell
    }
}

extension FavoritesViewController : UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let board:UIStoryboard = UIStoryboard(name: "Item", bundle: nil)
        let vc = board.instantiateViewController(withIdentifier: "ItemVIewController") as! ItemViewController

        vc.title            = favorites.items[indexPath.row].title
        vc.enableAdd        = false

        vc.itemId           = "\(favorites.items[indexPath.row].id)"
        vc.ownerId          = "\(favorites.items[indexPath.row].ownerID)"
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

extension FavoritesViewController {
    @objc
    func load() {
        favoritesRealm = realmDelegateReference!.objects(RealmItem.self).sorted(byKeyPath: "date", ascending: false)
        marketGroupDelegateReference!.marketGetByIdWrapper(item_ids: favoritesRealm) { storeData in
            self.favorites = storeData
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
        if self.collectionView.refreshControl!.isRefreshing {
            self.collectionView.refreshControl?.endRefreshing()
        }
    }
}
