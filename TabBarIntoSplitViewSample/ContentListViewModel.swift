//
//  ContentListViewModel.swift
//  TabBarIntoSplitViewSample
//
//  Created by Shuhei Yukawa on 2019/05/14.
//  Copyright © 2019 Shuhei Yukawa. All rights reserved.
//

import Foundation
import UIKit

protocol ContentListViewModel {
    associatedtype ViewObject
    var tabBarTitle: String { get }
    var navigationTitle: String { get }
    func getViewObjects() -> [ViewObject]
}

extension ContentListViewModel {
    func asExistContentListViewModel<T>() -> AnyListViewModel<T>? {
        return AnyListViewModel(self) as? AnyListViewModel<T>
    }
}

struct AnyListViewModel<T> {
    let viewObjects: () -> [T]
    let tabBarTitle: String
    let navigationBarTitle: String
    
    init<A: ContentListViewModel>(_ viewModel: A) where A.ViewObject == T {
        self.viewObjects = viewModel.getViewObjects
        self.tabBarTitle = viewModel.tabBarTitle
        self.navigationBarTitle = viewModel.navigationTitle
    }
}


protocol ViewObject {
    var title: String { get }
    var backgroundColor: UIColor { get }
}

struct FirstViewObject: ViewObject {
    let title: String
    let backgroundColor: UIColor
}

struct SecondViewObject: ViewObject {
    let title: String
    let backgroundColor: UIColor
}


final class FirstListViewModel: ContentListViewModel {
    typealias ViewObject = FirstViewObject
    
    var tabBarTitle: String { return "First" }
    var navigationTitle: String { return "First menu" }
    
    func getViewObjects() -> [FirstViewObject] {
        let first = FirstViewObject(title: "First First", backgroundColor: .red)
        let second = FirstViewObject(title: "First Second", backgroundColor: .green)
        let third = FirstViewObject(title: "First Third", backgroundColor: .blue)
        return [first, second, third]
    }
}

final class SecondListViewModel: ContentListViewModel {
    typealias ViewObject = SecondViewObject
    
    var tabBarTitle: String { return "Second" }
    var navigationTitle: String { return "Second menu" }
    
    func getViewObjects() -> [SecondViewObject] {
        let first = SecondViewObject(title: "Second First", backgroundColor: .white)
        let second = SecondViewObject(title: "Second Second", backgroundColor: .gray)
        let third = SecondViewObject(title: "Second Third", backgroundColor: .darkGray)
        return [first, second, third]
    }
}
