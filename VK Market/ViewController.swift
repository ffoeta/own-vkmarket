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
    
    let marketService : MarketService = MarketService() //Сервис для управления магазинами
    let serverService : ServerService = ServerService() //Сервис для управления сервером
    @IBOutlet weak var Item1: UIImageView!
    @IBOutlet weak var Item2: UIImageView!
    @IBOutlet weak var Item3: UIImageView!
    
    @IBOutlet weak var Label3: UILabel!
    @IBOutlet weak var Label2: UILabel!
    @IBOutlet weak var Label1: UILabel!
    @IBOutlet weak var myLabel: UILabel!
    @IBOutlet weak var ImageView: UIImageView!  //картинка была бы здесь
    
    @IBAction func MyButton(_ sender: UIButton) {
        self.serverService.getGroups({result in
            self.marketService.VKgetStoreById(groupId: result.results[1].groupID, {result in
                DispatchQueue.main.async {
                    self.myLabel.text = result[0].description
                }
                
                downloadImage(with: URL(string: result[0].photo200)!, imageView: self.ImageView)
            })
            self.marketService.VKgetStoreItems(groupId: result.results[1].groupID, count: "3", {result_ in
                print(result_.count)
                downloadImage(with: URL(string: result_.items[0].thumbPhoto)!, imageView: self.Item1)
                downloadImage(with: URL(string: result_.items[1].thumbPhoto)!, imageView: self.Item2)
                downloadImage(with: URL(string: result_.items[2].thumbPhoto)!, imageView: self.Item3)
                DispatchQueue.main.async {
                    self.Label1.text = result_.items[0].title
                    self.Label2.text = result_.items[1].title
                    self.Label3.text = result_.items[2].title
                }
                
            })
        })
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

}
