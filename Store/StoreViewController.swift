//
//  GroupViewController.swift
//  VK Market
//
//  Created by Lesha on 11/05/2019.
//  Copyright © 2019 y7c4k. All rights reserved.
//

import UIKit

class StoreViewController: UIViewController {
    
    @IBOutlet weak var imageVIew: UIImageView!
    
    var storeId                  : String!
    var storeDescription         : String!
    var storeRate                : String!
    var storeImage               : UIImage!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.imageVIew?.image           = storeImage
    }
    
    @IBAction func goToDescription(_ sender: Any) {
        let board:UIStoryboard = UIStoryboard(name: "Description", bundle: nil)
        let vc = board.instantiateViewController(withIdentifier: "DescriptionViewController") as! DescriptionViewController
        vc.descriptionText = self.storeDescription
        self.navigationController?.present(vc, animated: true)
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
