//
//  MasterNavigationCoodinator.swift
//  TabBarIntoSplitViewSample
//
//  Created by Shuhei Yukawa on 2019/05/13.
//  Copyright © 2019 Shuhei Yukawa. All rights reserved.
//

import Foundation
import UIKit

final class MasterNavigationCoodinator {
    let navigationController = UINavigationController()
    let applicationTabbarController = ApplicationTabBarController()
    
    var rootViewController: UINavigationController {
        return self.navigationController
    }

    func start() {
        self.navigationController.pushViewController(applicationTabbarController, animated: false)
    }
}
