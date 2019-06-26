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
        self.startAnimation()
    }
}

extension PressedEffectViewDelegate where Self: UIViewAnimating {
    func animationDidStop() {
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
        self.mainCircle.borderWidth = 0
        self.secondCircle.borderWidth = 1
        self.layer.addSublayer(self.mainCircle)
        //self.layer.addSublayer(self.secondCircle)
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
        let pathWidthArray = [20,0]
        let borderWidthAnimation = CAKeyframeAnimation(keyPath: #keyPath(CALayer.borderWidth))
        borderWidthAnimation.values = pathWidthArray
        borderWidthAnimation.duration = 0.5
        
        let pathScaleArray = [CATransform3DMakeScale(0.5, 0.5, 0.5), CATransform3DMakeScale(2, 2, 2)]
        let scaleAnimation = CAKeyframeAnimation(keyPath: #keyPath(CALayer.transform))
        scaleAnimation.values = pathScaleArray
        scaleAnimation.duration = 0.5
        
        let group = CAAnimationGroup()
        group.animations = [borderWidthAnimation, scaleAnimation]
        group.duration = 0.5
        group.delegate = self
        self.mainCircle.add(group, forKey: "mainCircleAnimation")
    }
    
}

extension PressedEffectView: CAAnimationDelegate {
    func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        if flag {
            self.delegate?.animationDidStop()
        }
    }
}


