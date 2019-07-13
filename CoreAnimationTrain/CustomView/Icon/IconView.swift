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
    var duration: Double = 0.75
    var timeOffset: Double = 0.0
    var iconColor: UIColor = .white
    
    var iconLayers: [CAShapeLayer] = []
    
    var isVisible: Bool! {
        didSet {
            let value: CGFloat = isVisible ? 1 : 0
            CATransaction.begin()
            CATransaction.setDisableActions(true)
            self.iconLayers.forEach { $0.strokeEnd = value }
            CATransaction.commit()
        }
    }
    
    /**
     Initial iconView
     - Parameter frame: Size icon
     - Parameter layers: Array layers who draws icon
    */
    init(frame: CGRect, layers: [CAShapeLayer]) {
        super.init(frame: frame)
        self.iconLayers = layers
        self.iconLayers.forEach{self.layer.addSublayer($0)}
        self.isVisible = false
    }
    
    private override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
