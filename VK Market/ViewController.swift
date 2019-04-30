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
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var ContentView: UIView!
    @IBOutlet weak var LabelTop: UILabel!
    @IBOutlet weak var LabelBot: UILabel!
    @IBOutlet weak var ScrollViewController: UIView!
    

    
    

    
    
    
    override func viewDidLoad() {
        let count = serverService.getN(n: 2)
        
        let width = self.view.frame.width
        let size = (width - 100)/2
        let additional = 175
        
        for i in 1...count {
            if i % 2 == 0 {
                let someImageView: UIImageView = UIImageView.getImageAtPosWithSize(x: 25 + additional, y: 25, size: Int(size))
                ContentView.addSubview(someImageView)
            } else {
                let someImageView: UIImageView = UIImageView.getImageAtPosWithSize(x: 25 , y: 25, size: Int(size))
                ContentView.addSubview(someImageView)
            }
            
        }
        
        
        
        
        
        super.viewDidLoad()
        
        
        
    
        // Do any additional setup after loading the view, typically from a nib.
    
        
    }

}
