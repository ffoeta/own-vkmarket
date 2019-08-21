//
//  InitViewController.swift
//  VK Market
//
//  Created by Lesha on 20/05/2019.
//  Copyright © 2019 y7c4k. All rights reserved.
//

import Foundation
import UIKit
import SwiftyVK
import NotificationBannerSwift

class LogInViewController : UIViewController {
    
    @IBAction func LogIn(_ sender: Any) {
        perform(#selector(loginViaVk), with: nil, afterDelay: 0.01)
    }

    @objc private func loginViaVk () {
        VK.sessions.default.logIn(onSuccess:{_ in
            DispatchQueue.main.async {
                let storyboardMain = UIStoryboard(name: "Main", bundle: nil)
                let vc = storyboardMain.instantiateViewController(withIdentifier: "Main") as! MainViewController
                StatusBarNotificationBanner(title: "welcome", style: .success).show()
                self.navigationController?.present(vc, animated: true)
            }
        }, onError: {_ in })
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        if (VK.sessions.default.state == .authorized) {
            let storyboardMain = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboardMain.instantiateViewController(withIdentifier: "Main") as! MainViewController
            self.navigationController?.present(vc, animated: true)
        } else {
            self.navigationController?.isNavigationBarHidden = true
        }
    }
}

