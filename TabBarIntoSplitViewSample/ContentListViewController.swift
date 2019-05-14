//
//  ContentListViewController.swift
//  TabBarIntoSplitViewSample
//
//  Created by Shuhei Yukawa on 2019/05/13.
//  Copyright © 2019 Shuhei Yukawa. All rights reserved.
//

import Foundation
import UIKit

final class ContentListViewController<T: ViewObject>: UITableViewController {
    private let viewModel: AnyListViewModel<T>
    
    init(viewModel: AnyListViewModel<T>) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        // viewDidLoad の時点では TabBar が取れない
        // Tab に入っていることが前提になってしまっている・・・
        self.tabBarController?.navigationItem.title = self.viewModel.navigationBarTitle
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.viewObjects().count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "Cell")
        cell.textLabel!.text = self.viewModel.viewObjects()[indexPath.item].title
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        let viewObject = self.viewModel.viewObjects()[indexPath.item]
        let title = viewObject.title
        let color = viewObject.backgroundColor
        let contentViewController = ContentViewController(title: title, backgroundColor: color)
        appDelegate.applicationCoodinator?.startDetailViewController(viewController: contentViewController)
    }
}
