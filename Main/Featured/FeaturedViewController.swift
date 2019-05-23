//
//  ViewController.swift
//  VK Market
//
//  Created by Lesha on 23/03/2019.
//  Copyright © 2019 y7c4k. All rights reserved.
//

import Foundation
import UIKit

class FeaturedViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var storeIdList = ServerGroups()
    var storeDataList = [Group]()
    
    let ItemCache = NSCache<NSString, UIImage>()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Featured"
        
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        
        var damagedGroupIds = [Int]()
        
        serverDelegateReference!.getGroups(parameters: ["":""]){ groupList in
            self.storeIdList = groupList
            marketGroupDelegateReference!.groupsGetByIdWrapper(groupIds: groupList) { storeData in
                print("converted to ",storeData.count," groups.")
                for i in 0...storeData.count-1 {
                    if storeData[i].description == nil {
                        damagedGroupIds.append(i)
                    }
                }
                self.storeDataList = storeData
                DispatchQueue.main.async {
                    for id in damagedGroupIds {
                        try! realmDelegateReference!.write {
                            let rows = realmDelegateReference!.objects(RealmItem.self).filter("ownerId = %@", "-\(self.storeDataList[id].id)")
                            realmDelegateReference!.delete(rows)
                        }
                        self.storeDataList.remove(at: id)
                    }
                }
                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                }
            }
        }
    }
}

extension FeaturedViewController : UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let board:UIStoryboard = UIStoryboard(name: "Store", bundle: nil)
        let vc = board.instantiateViewController(withIdentifier: "StoreViewController") as! StoreViewController
        self.navigationController?.pushViewController(vc, animated: true)
        
        vc.storeRate                =   String ( self.storeIdList.results[indexPath.row].rate )
        vc.title                    =   self.storeDataList[indexPath.row].name
        vc.storeId                  =   String( self.storeDataList[indexPath.row].id )
        vc.storeDescription         =   self.storeDataList[indexPath.row].description
        UIImage.downloadImage(with: self.storeDataList[indexPath.row].photo200, self.ItemCache) {
            image in
            vc.storeImage           =   image
        }
    }
}


extension FeaturedViewController : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return storeDataList.count;
    }
    
    func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return !collectionView.isDragging && !collectionView.isTracking
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "StoreCell", for: indexPath) as! StoreCell
        
        cell.configureAsStoreCell()
        
        UIImage.downloadImage(with: self.storeDataList[indexPath.row].photo200, self.ItemCache) {
            image in
            DispatchQueue.main.async {
                cell.imageView?.image = image
                cell.storeLabel?.text = self.storeDataList[indexPath.row].name
                cell.storeDescription?.text = self.storeDataList[indexPath.row].description
            }
        }
        return cell
    }
}
