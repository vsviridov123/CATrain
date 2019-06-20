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
    
    var popupButton: PopupButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.popupButton = PopupButton(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        self.popupButton.center = self.view.center
        self.view.addSubview(self.popupButton)
        self.view.backgroundColor = UIColor.black

        
    }
}

