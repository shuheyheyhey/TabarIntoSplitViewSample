//
//  SampleSplitViewController.swift
//  TabBarIntoSplitViewSample
//
//  Created by Shuhei Yukawa on 2019/05/13.
//  Copyright © 2019 Shuhei Yukawa. All rights reserved.
//

import Foundation
import UIKit

final class RootSplitViewController: UISplitViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setCompornent()
        self.delegate = self
    }
    
    private func setCompornent() {
        self.preferredDisplayMode = .allVisible
    }
}

extension RootSplitViewController: UISplitViewControllerDelegate {
    func splitViewController(_ splitViewController: UISplitViewController, collapseSecondary secondaryViewController: UIViewController, onto primaryViewController: UIViewController) -> Bool {
       return true
    }
}
