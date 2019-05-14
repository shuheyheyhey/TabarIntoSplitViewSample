//
//  ContentViewController.swift
//  TabBarIntoSplitViewSample
//
//  Created by Shuhei Yukawa on 2019/05/13.
//  Copyright © 2019 Shuhei Yukawa. All rights reserved.
//

import Foundation
import UIKit

final class ContentViewController: UIViewController {
    private let titleLabel = UILabel()
    private let button = UIButton()
    
    private let titleValue: String
    private let backgroundColor: UIColor
    
    init(title: String, backgroundColor: UIColor) {
        self.titleValue = title
        self.backgroundColor = backgroundColor
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setCompornent()
        self.setLayout()
    }
    
    private func setCompornent() {
        self.navigationItem.title = "ContentViewController"
        self.view.backgroundColor = self.backgroundColor
        
        self.titleLabel.translatesAutoresizingMaskIntoConstraints = false
        self.titleLabel.text = self.titleValue
        self.view.addSubview(self.titleLabel)
        
        self.button.translatesAutoresizingMaskIntoConstraints = false
        self.button.setTitle("To nested", for: .normal)
        self.button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        self.view.addSubview(self.button)
    }
    
    private func setLayout() {
        self.titleLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        self.titleLabel.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        
        self.button.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        self.button.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor, constant: 20).isActive = true
    }
    
    @objc private func buttonTapped() {
        let nestedViewController = UIViewController()
        self.navigationController?.pushViewController(nestedViewController, animated: true)
    }
}
