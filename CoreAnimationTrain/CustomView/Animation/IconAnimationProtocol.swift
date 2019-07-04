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
    func startAnimation()
}

extension IconAnimation {
    func startAnimation() {
        for index in 0..<self.iconLayers.count {
            self.strokeAnimation(layer: &self.iconLayers[index])
        }
    }
     
    private func strokeAnimation(layer: inout CAShapeLayer) {
        layer.strokeEnd = (1 - layer.strokeEnd)
    }
}
