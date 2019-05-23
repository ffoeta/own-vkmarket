//
//  MainNavigationController.swift
//  VK Market
//
//  Created by Lesha on 21/05/2019.
//  Copyright © 2019 y7c4k. All rights reserved.
//

import UIKit
import SwiftyVK

class MainNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        if isLoggedIn() {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "Root") as! RootViewController
            viewControllers = [vc]
        } else {
            perform(#selector(showLoginController), with: nil, afterDelay: 0.01)
        }
    }
    

    private func isLoggedIn () -> Bool {
        if VK.sessions.default.accessToken == nil {
            return false
        }
        return true
    }
    
    @objc private func showLoginController() {
        let storyboard = UIStoryboard(name: "LogIn", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "LogIn") as! LogInViewController
        present(vc, animated: true)
    }

}
