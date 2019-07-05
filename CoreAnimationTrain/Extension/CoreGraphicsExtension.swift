//
//  CoreGraphicsExtension.swift
//  CoreAnimationTrain
//
//  Created by Владислав Свиридов on 21/06/2019.
//  Copyright © 2019 Vladislav Sviridov. All rights reserved.
//

import Foundation
import UIKit


public extension CGPoint {
    func offset(x: CGFloat, y: CGFloat) -> CGPoint {
        return CGPoint(x: self.x + x, y: self.y + y)
    }
}

public extension CGSize {
    mutating func changeSize(width: CGFloat, height: CGFloat) {
        self.width = self.width + width
        self.height = self.height + height
    }
    
    func scaleSize(multiplierWidth: CGFloat, multiplierHeight: CGFloat) -> CGSize {
        return CGSize(width: self.width * multiplierWidth, height: self.height * multiplierHeight)
    }
}
