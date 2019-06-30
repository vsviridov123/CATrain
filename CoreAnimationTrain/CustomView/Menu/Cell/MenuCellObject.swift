//
//  MenuCellObject.swift
//  CoreAnimationTrain
//
//  Created by Влад Свиридов on 30/06/2019.
//  Copyright © 2019 Vladislav Sviridov. All rights reserved.
//

import Foundation
import UIKit

struct MenuCellObject {
    var iconView: UIView
    var name: String
    var animationTimeOffset: Double = 0
    
    init(iconView: UIView, name: String) {
        self.iconView = iconView
        self.name = name
    }
}
