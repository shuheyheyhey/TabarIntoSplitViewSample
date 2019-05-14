//
//  DetailNavigationCoodinator.swift
//  TabBarIntoSplitViewSample
//
//  Created by Shuhei Yukawa on 2019/05/13.
//  Copyright © 2019 Shuhei Yukawa. All rights reserved.
//

import Foundation
import UIKit

final class DetailNavigationCoodinator {
    let navigationController = UINavigationController()
    
    var rootViewController: UINavigationController {
        return self.navigationController
    }
    
    func startRootContent(viewController: UIViewController) {
        self.navigationController.viewControllers = [viewController]
    }
}
