//
//  FirstViewModel.swift
//  TabBarIntoSplitViewSample
//
//  Created by Shuhei Yukawa on 2019/05/14.
//  Copyright © 2019 Shuhei Yukawa. All rights reserved.
//

import Foundation
import UIKit

protocol ContentViewModel {
    associatedtype ViewObject
    var viewObjects: [ViewObject] { get }
}

struct FirstViewObject {
    let title: String
    let backgroundColor: UIColor
}

final class FirstViewModel: ContentViewModel {
    typealias ViewObject = FirstViewObject
    
    var viewObjects: [FirstViewObject] {
        let first = FirstViewObject(title: "First First", backgroundColor: .red)
        let second = FirstViewObject(title: "First Second", backgroundColor: .green)
        let third = FirstViewObject(title: "First Third", backgroundColor: .blue)
        return [first, second, third]
    }
}
