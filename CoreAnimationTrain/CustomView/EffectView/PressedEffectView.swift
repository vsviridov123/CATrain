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
    
    public weak var delegate: PressedEffectViewDelegate?
    public var duration: Double = 0.75
    public var circleColor: UIColor = .white
    public var innerAnimation: Bool = true
    
    convenience init(center: CGPoint, radius: CGFloat) {
        self.init(frame: CGRect.zero)
        self.frame.size = CGSize(width: radius + 15 , height: radius + 15)
        self.center = center
        
        self.mainCircle.frame = self.bounds
        self.secondCircle.frame = CGRect(origin: self.frame.origin.offset(x: 15, y: 15), size: CGSize(width: radius, height: radius))
        self.mainCircle.cornerRadius = self.bounds.width / 2
        self.secondCircle.cornerRadius = radius / 2
        self.mainCircle.borderColor = self.circleColor.withAlphaComponent(0.5).cgColor
        self.secondCircle.borderColor = self.circleColor.withAlphaComponent(0.75).cgColor
        self.mainCircle.backgroundColor = UIColor.clear.cgColor
        self.secondCircle.backgroundColor = UIColor.clear.cgColor
        self.mainCircle.borderWidth = 0
        self.secondCircle.borderWidth = 0
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
        self.mainCircleAnimation()
        self.secondCircleAnimation()
    }
    
    private func mainCircleAnimation() {
        let duration: Double = self.duration
        
        let pathWidthArray = [15,0]
        let borderWidthAnimation = CAKeyframeAnimation(keyPath: #keyPath(CALayer.borderWidth))
        borderWidthAnimation.values = pathWidthArray
        borderWidthAnimation.duration = duration
        
        let pathScaleArray = [CATransform3DMakeScale(1, 1, 1),
                              CATransform3DMakeScale(0.5, 0.5, 0.5),
                              CATransform3DMakeScale(1, 1, 1),
                              CATransform3DMakeScale(1.2, 1.2, 1.2)]
        let scaleAnimation = CAKeyframeAnimation(keyPath: #keyPath(CALayer.transform))
        let pathScaleTime = [0, 0.33, 0.66 , 1.0]
        scaleAnimation.keyTimes = pathScaleTime as [NSNumber]
        scaleAnimation.values = pathScaleArray
        scaleAnimation.duration = duration
        
        let group = CAAnimationGroup()
        group.animations = [borderWidthAnimation, scaleAnimation]
        group.delegate = self
        group.duration = duration
        self.mainCircle.add(group, forKey: "mainCircleAnimation")
    }
    
    private func secondCircleAnimation() {
        let timeOffset: Double = 2.0 / 3.0 * self.duration
        let duration: Double = self.duration - timeOffset
        
        let pathWidthArray = [10,0]
        let borderWidthAnimation = CAKeyframeAnimation(keyPath: #keyPath(CALayer.borderWidth))
        borderWidthAnimation.values = pathWidthArray
        borderWidthAnimation.duration = duration
        borderWidthAnimation.timeOffset = timeOffset
        
        let scaleAnimation = CABasicAnimation(keyPath: #keyPath(CALayer.transform))
        scaleAnimation.duration = duration
        scaleAnimation.fromValue = self.secondCircle.transform
        scaleAnimation.toValue = CATransform3DMakeScale(2, 2, 2)
        borderWidthAnimation.timeOffset = timeOffset
        
        let group = CAAnimationGroup()
        group.animations = [borderWidthAnimation, scaleAnimation]
        group.duration = self.duration
        group.timeOffset = timeOffset
        self.secondCircle.add(group, forKey: "secondCircleAnimation")
    }
}

extension PressedEffectView: CAAnimationDelegate {
    func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        if flag && self.innerAnimation {
            self.delegate?.animationDidStop()
        }
    }
}
