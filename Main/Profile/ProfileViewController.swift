//
//  ProfileViewController.swift
//  VK Market
//
//  Created by Lesha on 13/05/2019.
//  Copyright © 2019 y7c4k. All rights reserved.
//

import UIKit
import SwiftyVK

class ProfileViewController: UIViewController {
    
    var userId : String!
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBAction func viewInVK(_ sender: Any) {
        guard let url = URL(string: "https://vk.com/id" + self.userId) else { return }
        DispatchQueue.main.async {
            UIApplication.shared.open(url)
        }
    }
    
    @IBAction func LogOut(_ sender: Any) {
        VK.sessions.default.logOut()
        let board = UIStoryboard(name: "LogIn", bundle: nil)
        let vc = board.instantiateViewController(withIdentifier: "LogIn") as! LogInViewController
        self.navigationController?.present(vc, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let Parameters = [Parameter.versionId :  DEFAULT_VERSION_,
                          Parameter.fields    :  "photo_200"      ]
        
        VK.API.Users.get(Parameters)
            .onSuccess {
                if let profile = try? JSONDecoder().decode(ProfileInfo.self, from: $0) {
                    print("VK \nProfile successfuly recieved from Vk API.")
                    DispatchQueue.main.async {
                        self.title = profile[0].firstName
                        self.userId = "\(profile[0].id)"
                        UIImage.downloadImage(with: profile[0].photo200, nil){ image in
                            DispatchQueue.main.async {
                                self.imageView?.image = image
                            }
                        }
                    }
                } else {
                    print("VK \nFailed to parse Profile.")
                }
            }.onError {
                print($0)
        }.send()
    }
    
}
