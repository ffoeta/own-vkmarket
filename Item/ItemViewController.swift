//
//  ItemViewController.swift
//  VK Market
//
//  Created by Lesha on 13/05/2019.
//  Copyright © 2019 y7c4k. All rights reserved.
//

import UIKit
import RealmSwift
import SwiftyVK
import NotificationBannerSwift

class ItemViewController: UIViewController {

    @IBOutlet weak var complainButton: UIButton!
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var contactButton: UIButton!
    
    var item : StoreItemsEx = StoreItemsEx()

    var itemId    : String!
    var ownerId   : String!
    var enableAdd = true
    
    @IBAction func contactSeller(_ sender: Any) {
        marketGroupDelegateReference!.groupsGetByIdWrapper(groupIds: String(ownerId.dropFirst())) {
            group in
            guard let url = URL(string: "https://vk.com/market" + self.getItemId()) else { return }
            DispatchQueue.main.async {
                UIApplication.shared.open(url)
            }
        }
    }
    
    @IBAction func addToFavorites(_ sender: Any) {
        
        let realmItem = RealmItem()
        realmItem.id        = itemId
        realmItem.ownerId   = ownerId
        
        if realmDelegateReference!.object(ofType: RealmItem.self, forPrimaryKey: realmItem.id) != nil {
            StatusBarNotificationBanner(title: "Already in favorites", style: .warning).show()
        } else {
            try! realmDelegateReference!.write {
                realmDelegateReference!.add(realmItem)
                StatusBarNotificationBanner(title: "Added", style: .success).show()
            }
        }
    }
    
    @IBAction func complain(_ sender: Any) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        
        self.collectionView.alwaysBounceHorizontal = true
        self.collectionView.bounces = true
        
        marketGroupDelegateReference!.marketGetByIdExtendedWrapper(item_id: self.getItemId()) {
            item in
            self.item = item
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
        
        if !self.enableAdd {
            self.addButton?.isHidden = true
            self.addButton?.isEnabled = false
        }
    }
    
    func getItemId() -> String {
        return self.ownerId+"_"+self.itemId
    }
}

extension ItemViewController : UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let board:UIStoryboard = UIStoryboard(name: "CloseView", bundle: nil)
        let vc = board.instantiateViewController(withIdentifier: "close") as! closeView
        vc.imageURL = self.item.items[0].photos[indexPath.row].sizes[2].url
        self.navigationController?.present(vc, animated: true)
    }
}


extension ItemViewController : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if self.item.items.count == 0 {
            return 0
        }
        return self.item.items[0].photos.count;
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImageCell", for: indexPath) as! ImageCell
        
        cell.configureAsImageCell()
        
        UIImage.downloadImage(with: self.item.items[0].photos[indexPath.row].sizes[0].url, nil) {
            image in
            DispatchQueue.main.async {
                cell.imageView?.image = image
            }
        }
        return cell
    }
}
