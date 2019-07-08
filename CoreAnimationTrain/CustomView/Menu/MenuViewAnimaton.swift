//
//  MenuViewAnimaton.swift
//  CoreAnimationTrain
//
//  Created by Влад Свиридов on 04/07/2019.
//  Copyright © 2019 Vladislav Sviridov. All rights reserved.
//

import Foundation
import UIKit

extension MenuView {
    
    private enum AnimationConstants {
        static let cornerAnimationName = "corner_frame_animation"
    }
    
    public func animationRolledFromCurrentState() {
        switch self.state {
        case .rolled:
            self.popupAnimation(to: .normal, newFrame: self.stateValue[.normal] ?? .zero)
            self.state = .normal
        case .normal:
            self.popupAnimation(to: .rolled, newFrame: self.stateValue[.rolled] ?? .zero)
            self.state = .rolled
        }
    }
    
    public func popupAnimation(to state: MenuViewState, newFrame: CGRect, duration: Double = 0.5) {
        
        self.state = state
        
        var newRadius: CGFloat = 0.0
        
        switch state {
        case .rolled:
            newRadius = self.frame.width / 2
        case .normal:
            newRadius = 15.0
        }
        
        let cornerAnimation = CABasicAnimation(keyPath: #keyPath(CALayer.cornerRadius))
        cornerAnimation.duration = duration
        cornerAnimation.fromValue = self.layer.cornerRadius
        cornerAnimation.toValue = newRadius
        
        let scaleAnimation = CABasicAnimation(keyPath: #keyPath(CALayer.transform))
        scaleAnimation.fromValue = self.contentView.layer.transform
        scaleAnimation.toValue = CATransform3DMakeScale(newFrame.width / self.frame.width,newFrame.height / self.frame.height, 1)
        scaleAnimation.duration = duration
        
        let positionAnimation = CABasicAnimation(keyPath: #keyPath(CALayer.position))
        positionAnimation.duration = duration
        positionAnimation.fromValue = self.contentView.layer.position
        positionAnimation.toValue = newFrame.origin

        let groupAnimaiton = CAAnimationGroup()
        groupAnimaiton.duration = duration
        groupAnimaiton.animations = [cornerAnimation, scaleAnimation,positionAnimation]
        
        self.contentView.layer.cornerRadius = newRadius
        self.contentView.layer.transform = CATransform3DMakeScale(newFrame.width / self.frame.width,newFrame.height / self.frame.height, 1)
        self.contentView.layer.position = newFrame.origin
        self.contentView.layer.add(groupAnimaiton, forKey: AnimationConstants.cornerAnimationName)
        
    }
}
