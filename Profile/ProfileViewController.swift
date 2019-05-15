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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let Parameters = [Parameter.versionId :  DEFAULT_VERSION_]
        
        VK.API.Account.getProfileInfo(Parameters)
            .onSuccess {
                if let profile = try? JSONDecoder().decode(ProfileInfo.self, from: $0) {
                    print("VK \nProfile successfuly recieved from Vk API.")
                    DispatchQueue.main.async {
                        self.title = profile.firstName
                    }
                } else {
                    print("VK \nFailed to parse Profile.")
                }
            }.onError {
                print($0)
        }.send()
    }
    
}
