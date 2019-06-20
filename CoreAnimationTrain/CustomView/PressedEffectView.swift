//
//  PressedEffectView.swift
//  CoreAnimationTrain
//
//  Created by Владислав Свиридов on 19/06/2019.
//  Copyright © 2019 Vladislav Sviridov. All rights reserved.
//

import UIKit

class PressedEffectView: UIView {
    
    var mainCircle = CALayer()
    private var secondCircle = CALayer()
    
    init(parent: UIView) {
        super.init(frame: CGRect.zero)
        self.frame = parent.frame
        self.frame.size.changeSize(width: 10, height: 10)
        self.center = parent.center
        
        self.mainCircle.frame = self.bounds
        self.secondCircle.frame = self.bounds
        self.mainCircle.cornerRadius = self.frame.width / 2
        self.secondCircle.cornerRadius = self.frame.width / 2
        self.mainCircle.borderColor = UIColor.white.withAlphaComponent(0.5).cgColor
        self.secondCircle.borderColor = UIColor.white.withAlphaComponent(0.5).cgColor
        self.mainCircle.backgroundColor = UIColor.clear.cgColor
        self.secondCircle.backgroundColor = UIColor.clear.cgColor
        self.mainCircle.borderWidth = 1
        self.secondCircle.borderWidth = 1
        self.layer.addSublayer(self.mainCircle)
        self.layer.addSublayer(self.secondCircle)
    }
    
    private override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
    public func startAnimation() {
        mainCircleAnimation()
    }
    
    private func mainCircleAnimation() {
        let pathArray = [5.0, 10.0]
        let borderWidthAnimation = CAKeyframeAnimation(keyPath: #keyPath(CALayer.borderWidth))
        borderWidthAnimation.values = pathArray
        borderWidthAnimation.duration = 0.5
        self.mainCircle.add(borderWidthAnimation, forKey: "borderWidthMaincircle")
        
    }
    
}

