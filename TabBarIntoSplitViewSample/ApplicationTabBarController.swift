//
//  ApplicationTabBarController.swift
//  TabBarIntoSplitViewSample
//
//  Created by Shuhei Yukawa on 2019/05/13.
//  Copyright © 2019 Shuhei Yukawa. All rights reserved.
//

import Foundation
import UIKit

final class ApplicationTabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setCompornent()
    }
    
    func setCompornent() {
        self.navigationItem.title = "Menu"
        
        let firstListViewController = FirstListViewController(viewModel: FirstViewModel())
        let secondListViewController = SecondListViewController(viewModel: SecondViewModel())
        self.viewControllers = [firstListViewController, secondListViewController]
    }
}
