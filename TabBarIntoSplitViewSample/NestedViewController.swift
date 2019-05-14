//
//  NestedViewController.swift
//  TabBarIntoSplitViewSample
//
//  Created by Shuhei Yukawa on 2019/05/14.
//  Copyright © 2019 Shuhei Yukawa. All rights reserved.
//

import Foundation
import UIKit

final class NestedViewController: UIViewController {
    private let titleValue: String
    
    init(titleValue: String) {
        self.titleValue = titleValue
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "\(self.titleValue) NestedViewController"
    }
}
