//
//  ViewController.swift
//  CoreAnimationTrain
//
//  Created by Владислав Свиридов on 17/06/2019.
//  Copyright © 2019 Vladislav Sviridov. All rights reserved.
//

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
}

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

