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

class LogInViewController : UIViewController {
    
    @IBAction func LogIn(_ sender: Any) {
        perform(#selector(loginViaVk), with: nil, afterDelay: 0.01)
    }
    
    @objc private func loginViaVk () {
        self.dismiss(animated: true) {
            VK.sessions.default.logIn(onSuccess:{_ in}, onError: {_ in})
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

