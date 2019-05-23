//
//  CategoryViewController.swift
//  VK Market
//
//  Created by Lesha on 13/05/2019.
//  Copyright © 2019 y7c4k. All rights reserved.
//

import UIKit

class CategoriesViewController: UIViewController {
    
    var storeId    : String!
    var categories : [String] = [String]()
    
    var storeItems : StoreItems = StoreItems()
    
    @IBOutlet weak var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        
        self.load()
        
        self.collectionView.register(UINib(nibName: "CategoryCell", bundle: nil), forCellWithReuseIdentifier: "CategoryCell")
    }
    
}

extension CategoriesViewController {
    func createList() {
        for item in self.storeItems.items {
            if !(self.categories.contains(item.category.name)) {
                self.categories.append(item.category.name)
            }
        }
    }
}

extension CategoriesViewController : UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
}

extension CategoriesViewController : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.categories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryCell", for: indexPath) as! CategoryCell
        if categories.count != 0 {
            print(categories.count)
            cell.categoryLabel?.text = categories[indexPath.row]
        }
        
        return cell
    }
    
}

extension CategoriesViewController {
    func load() {
        let offset = 0
        let current = 200
        marketGroupDelegateReference!.marketGetWrapper(groupId: self.storeId, count: current, offset: offset) { storeData in
            self.storeItems.items.append(contentsOf: storeData.items)
            self.storeItems.count = storeData.count
            self.createList()
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
        
        
    }
}
