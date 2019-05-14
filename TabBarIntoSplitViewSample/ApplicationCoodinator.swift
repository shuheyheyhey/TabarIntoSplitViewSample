//
//  ApplicationCoodinator.swift
//  TabBarIntoSplitViewSample
//
//  Created by Shuhei Yukawa on 2019/05/13.
//  Copyright © 2019 Shuhei Yukawa. All rights reserved.
//

import Foundation
import UIKit

final class ApplicationCoodinator {
    private let window: UIWindow
    private let rootSplitViewController: RootSplitViewController
    
    public let masterNavigationCoodinator = MasterNavigationCoodinator()
    public let detailNavigationCoodinator = DetailNavigationCoodinator()
    
    init(window: UIWindow) {
        self.window = window
        self.rootSplitViewController = RootSplitViewController()
    }
    
    func start() {
        self.masterNavigationCoodinator.start()
        self.rootSplitViewController.viewControllers = [
            self.masterNavigationCoodinator.rootViewController,
            self.detailNavigationCoodinator.rootViewController
        ]
        
        self.window.rootViewController = self.rootSplitViewController
        self.window.makeKeyAndVisible()
    }
    
    func startDetailViewController(viewController: UIViewController) {
        self.detailNavigationCoodinator.startRootContent(viewController: viewController)
        if self.rootSplitViewController.isCollapsed {
            self.rootSplitViewController.showDetailViewController(self.detailNavigationCoodinator.rootViewController, sender: nil)
        }
    }
}
