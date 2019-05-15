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
    
    @IBOutlet weak var tableView: UITableView!
    
    var favoritesRealm : Results<RealmItem>!
    var favorites   : StoreItems = StoreItems()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
        let realm = try! Realm()
        
        favoritesRealm = realm.objects(RealmItem.self)
        
        DispatchQueue.main.async {
             self.tableView.reloadData()
        }
        
        self.title = "Favorites"
    }
    
    override func viewDidAppear(_ animated: Bool) {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}

extension FavoritesViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favoritesRealm.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FavoriteCell", for: indexPath) as! FavoriteCell
        cell.number?.text = self.favoritesRealm[indexPath.row].id
        return cell
    }
}

extension FavoritesViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    }
}
