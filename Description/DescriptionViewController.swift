//
//  DesctiptionViewController.swift
//  VK Market
//
//  Created by Lesha on 08/07/2019.
//  Copyright © 2019 y7c4k. All rights reserved.
//

import UIKit

class DescriptionViewController: UIViewController {
    
    @IBOutlet weak var descriptionLabel: UILabel!
    var descriptionText : String!
    
    @IBAction func goBack(_ sender: UITapGestureRecognizer) {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.descriptionLabel?.text = self.descriptionText
        // Do any additional setup after loading the view.
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
