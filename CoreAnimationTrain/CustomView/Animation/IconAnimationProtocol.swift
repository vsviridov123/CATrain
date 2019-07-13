//
//  IconAnimation.swift
//  CoreAnimationTrain
//
//  Created by Влад Свиридов on 30/06/2019.
//  Copyright © 2019 Vladislav Sviridov. All rights reserved.
//

import Foundation
import UIKit

protocol IconAnimation: class {
    var iconLayers: [CAShapeLayer] { get set }
    var duration: Double { get set }
    var timeOffset: Double { get set }
    func startAnimationFromCurrentState()
    func startAnimation(fromValue: CGFloat, toValue: CGFloat)
}

extension IconAnimation {
    
    func startAnimationFromCurrentState() {
        for index in 0..<self.iconLayers.count {
            self.strokeEndAnimationFromCurrentState(layer: &self.iconLayers[index])
        }
    }
    
    func startAnimation(fromValue: CGFloat, toValue: CGFloat) {
        for index in 0..<self.iconLayers.count {
            self.strokeEndAnimation(layer: &self.iconLayers[index], fromValue: fromValue, toValue: toValue)
        }
    }
    
    private func strokeEndAnimation(layer: inout CAShapeLayer, fromValue: CGFloat, toValue: CGFloat)  {
        let strokeAnimation = CABasicAnimation(keyPath: #keyPath(CAShapeLayer.strokeEnd))
        strokeAnimation.duration = self.duration
        strokeAnimation.beginTime = self.timeOffset + layer.convertTime(CACurrentMediaTime(), from: nil)
        strokeAnimation.fromValue = fromValue
        strokeAnimation.toValue = toValue
        strokeAnimation.fillMode = .backwards
        layer.strokeEnd = toValue
        layer.removeAllAnimations()
        layer.add(strokeAnimation, forKey: "strokeEnd_animation")
    }
     
    private func strokeEndAnimationFromCurrentState(layer: inout CAShapeLayer) {
        self.strokeEndAnimation(layer: &layer, fromValue: layer.strokeEnd, toValue: 1 - layer.strokeEnd)
    }
}
