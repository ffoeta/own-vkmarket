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
    
    let items_ids = "-124527492_250407"
    
    let marketService : MarketService = MarketService() //Сервис для управления

    @IBOutlet weak var ImageView: UIImageView!  //картинка была бы здесь
    @IBAction func MyButton(_ sender: UIButton) {
        self.marketService.VKgetStoreById(groupId: SHOPS_LIST!.results[1].groupID,{result in
            downloadImage(with: URL(string: result[0].photo200)!, imageView: self.ImageView)
        })
        
//        marketService.VKgetItemById(item_ids: items_ids, {result in
//            downloadImage(with: URL(string: result.items[0].photos[0].sizes[0].url)!, imageView: self.ImageView)
//        })
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        serverDelegateReference!.getShops({result in
            SHOPS_LIST = result
        })
        
        // Do any additional setup after loading the view, typically from a nib.
    }

}
