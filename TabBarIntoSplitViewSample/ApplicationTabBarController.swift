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
    
    func createViewModel<X: ContentListViewModel, T: ViewObject>(_ x: X) -> AnyListViewModel<T>? where T == X.ViewObject {
        return x.asExistContentListViewModel()
    }
    
    func setCompornent() {
        let firstViewModel =  self.createViewModel(FirstListViewModel())
        let firstListViewController = ContentListViewController(viewModel: firstViewModel!)
        firstListViewController.tabBarItem.title = firstViewModel?.tabBarTitle
        
        let secondViewModel = self.createViewModel(SecondListViewModel())
        let secondListViewController = ContentListViewController(viewModel: secondViewModel!)
        secondListViewController.tabBarItem.title = secondViewModel?.tabBarTitle
        
        self.viewControllers = [firstListViewController, secondListViewController]
    }
}
