//
//  IconView.swift
//  CoreAnimationTrain
//
//  Created by Влад Свиридов on 01/07/2019.
//  Copyright © 2019 Vladislav Sviridov. All rights reserved.
//

import Foundation
import UIKit

class Icon: UIView,IconAnimation {
    
    var iconLayers: [CAShapeLayer] = []
    var duration: Double = 0.75
    var timeOffset: Double = 0.0
    var iconColor: UIColor = .white
    
    init(frame: CGRect, layers: [CAShapeLayer]) {
        super.init(frame: frame)
        self.iconLayers = layers
        for layer in layers {
            self.layer.addSublayer(layer)
        }
    }
    
    private override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
