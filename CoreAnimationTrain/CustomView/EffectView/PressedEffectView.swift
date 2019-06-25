//
//  PressedEffectView.swift
//  CoreAnimationTrain
//
//  Created by Владислав Свиридов on 19/06/2019.
//  Copyright © 2019 Vladislav Sviridov. All rights reserved.
//

import UIKit

protocol PressedEffectViewDelegate: class {
    func animationDidStop()
}

extension PressedEffectViewDelegate where Self: UIViewSimpleAnimation {
    func animationDidStop() {
        //guard let view = self as? UIViewSimpleAnimation else { return }
        self.startAnimation()
    }
}

class PressedEffectView: UIView {
    
    private var mainCircle = CALayer()
    private var secondCircle = CALayer()
    
    weak var delegate: PressedEffectViewDelegate?
    
    convenience init(center: CGPoint, radius: CGFloat) {
        self.init(frame: CGRect.zero)
        self.frame.size = CGSize(width: radius + 15 , height: radius + 15)
        self.mainCircle.frame = self.bounds
        self.secondCircle.frame = self.bounds
        self.center = center

        self.mainCircle.frame = self.bounds
        self.secondCircle.frame = self.bounds
        self.mainCircle.cornerRadius = self.bounds.width / 2
        self.secondCircle.cornerRadius = self.bounds.width / 2
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
        borderWidthAnimation.delegate = self
        self.mainCircle.add(borderWidthAnimation, forKey: "borderWidthMaincircle")
        
    }
    
}

extension PressedEffectView: CAAnimationDelegate {
    func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        if flag {
        }
    }
}


