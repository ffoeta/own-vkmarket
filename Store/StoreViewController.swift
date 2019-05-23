//
//  GroupViewController.swift
//  VK Market
//
//  Created by Lesha on 11/05/2019.
//  Copyright © 2019 y7c4k. All rights reserved.
//

import UIKit

class StoreViewController: UIViewController {
    
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var categorylabel: UIButton!
    @IBOutlet weak var imageVIew: UIImageView!
    @IBOutlet weak var rateLabel: UILabel!
    
    var storeId                  : String!
    var storeDescription         : String!
    var storeRate                : String!
    var storeImage               : UIImage!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.descriptionLabel?.text     = storeDescription
        self.imageVIew?.image           = storeImage
        self.rateLabel?.text            = storeRate
    }
    
    @IBAction func goToCategories(_ sender: Any) {
        let board:UIStoryboard = UIStoryboard(name: "Categories", bundle: nil)
        let vc = board.instantiateViewController(withIdentifier: "CategoriesViewController") as! CategoriesViewController
        vc.storeId = self.storeId
        vc.title = "Catogories"
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func goToItems(_ sender: Any) {
        let board:UIStoryboard = UIStoryboard(name: "Items", bundle: nil)
        let vc = board.instantiateViewController(withIdentifier: "ItemsViewController") as! ItemsViewController
        vc.storeID = self.storeId
        vc.title = "Items"
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func viewStore(_ sender: Any) {
        marketGroupDelegateReference!.groupsGetByIdWrapper(groupIds: storeId) {
            group in
            guard let url = URL(string: "https://vk.com/" + group[0].screenName) else { return }
            DispatchQueue.main.async {
                UIApplication.shared.open(url)
            }
        }
    }
}
