//
//  ViewController.swift
//  VK Market
//
//  Created by Lesha on 23/03/2019.
//  Copyright © 2019 y7c4k. All rights reserved.
//

import Foundation
import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    let marketService : MarketService = MarketService() //Сервис для управления магазинами
    let serverService : ServerService = ServerService() //Сервис для управления сервером
    
    var storeIdList = ServerGroups()
    var storeDataList = [Group]()
    
    let ItemCache = NSCache<NSString, UIImage>()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Featured"
        
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        
        self.serverService.getGroups({ storeId in
            self.storeIdList = storeId
            print("recieved ",storeId.count," groups from server.")
            self.marketService.getData(groupIds: self.storeIdList) { storeData in
                print("converted to ",storeData.count," groups.")
                self.storeDataList = storeData
                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                }
            }
        })
    }
}

extension ViewController : UICollectionViewDelegate {
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


extension ViewController : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return storeDataList.count;
    }
    
    func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return !collectionView.isDragging && !collectionView.isTracking
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "StoreCell", for: indexPath) as! StoreCell
        
        
        cell.contentView.layer.cornerRadius = 4.0
        cell.contentView.layer.borderWidth = 1.0
        cell.contentView.layer.borderColor = UIColor.clear.cgColor
        cell.contentView.layer.masksToBounds = false
        cell.layer.shadowColor = UIColor.gray.cgColor
        cell.layer.shadowOffset = CGSize(width: 0, height: 1.0)
        cell.layer.shadowRadius = 4.0
        cell.layer.shadowOpacity = 1.0
        cell.layer.masksToBounds = false
        cell.layer.shadowPath = UIBezierPath(roundedRect: cell.bounds, cornerRadius: cell.contentView.layer.cornerRadius).cgPath
        
        
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
