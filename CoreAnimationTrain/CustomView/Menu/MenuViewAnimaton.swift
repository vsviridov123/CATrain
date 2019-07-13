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
        static let boundsAnimation = "bounds_animation"
        static let positionAnimationName = "position_animation"
    }
    
    public func animationRolledFromCurrentState() {
        switch self.state {
        case .rolled:
            self.popupAnimation(to: .normal, newFrame: self.stateValue[.normal] ?? .zero)
        case .normal:
            self.popupAnimation(to: .rolled, newFrame: self.stateValue[.rolled] ?? .zero)
        }
    }
    
    public func popupAnimation(to state: MenuViewState, newFrame: CGRect) {
        
        let boundsAnimation = CABasicAnimation(keyPath: #keyPath(CALayer.bounds))
        boundsAnimation.duration = self.duration
        boundsAnimation.fromValue = self.contentView.bounds
        boundsAnimation.toValue = CGRect(origin: .zero, size: newFrame.size)
        
        let positionAnimation = CABasicAnimation(keyPath: #keyPath(CALayer.position))
        positionAnimation.duration = self.duration
        positionAnimation.fromValue = self.layer.position
        positionAnimation.toValue = newFrame.origin.offset(x: newFrame.width / 2, y: newFrame.height / 2)
        
        self.state = state
        self.contentView.bounds = CGRect(origin: .zero, size: newFrame.size)
        self.contentView.layer.add(boundsAnimation, forKey: AnimationConstants.boundsAnimation)
        self.layer.position = newFrame.origin.offset(x: newFrame.width / 2, y: newFrame.height / 2)
        self.layer.add(positionAnimation, forKey: AnimationConstants.positionAnimationName)
        
    }
}
