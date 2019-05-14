//
//  SecondViewModel.swift
//  TabBarIntoSplitViewSample
//
//  Created by Shuhei Yukawa on 2019/05/14.
//  Copyright © 2019 Shuhei Yukawa. All rights reserved.
//

import Foundation
import UIKit

struct SecondViewObject {
    let title: String
    let backgroundColor: UIColor
}

final class SecondViewModel: ContentViewModel {
    typealias ViewObject = SecondViewObject
    
    var viewObjects: [SecondViewObject] {
        let first = SecondViewObject(title: "Second First", backgroundColor: .white)
        let second = SecondViewObject(title: "Second Second", backgroundColor: .gray)
        let third = SecondViewObject(title: "Second Third", backgroundColor: .darkGray)
        return [first, second, third]
    }
}
