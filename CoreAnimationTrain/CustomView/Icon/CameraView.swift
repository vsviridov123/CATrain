//
//  CameraView.swift
//  CoreAnimationTrain
//
//  Created by Владислав Свиридов on 27/06/2019.
//  Copyright © 2019 Vladislav Sviridov. All rights reserved.
//

import UIKit

class CameraView: UIView {
    
    private var externalLayer: CAShapeLayer!
    private var internalLayer: CAShapeLayer!
    private var withAnimation: Bool!
    private var strokeEnd = false
    
    public var colorCamera: UIColor = .white
    
    init(frame: CGRect, withAnimation: Bool) {
        super.init(frame: frame)
        self.withAnimation = withAnimation
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func draw(_ rect: CGRect) {
        self.drawExternalLayer(rect)
        self.drawInternalLayer(rect)
    }
    
    private func drawExternalLayer(_ rect: CGRect) {
        let layer = CAShapeLayer()
        let path = UIBezierPath()
        path.lineJoinStyle = .round
        
        // Примерное отношение размеров
        path.move(to: CGPoint(x: rect.width / 2, y: 0))
        path.addLine(to: path.currentPoint.offset(x: -self.frame.width / 6, y: 0))
        path.addQuadCurve(to: CGPoint(x: 0, y: 0).offset(x: 0, y: self.frame.height * 0.2), controlPoint: path.currentPoint.offset(x: 0, y: self.frame.height * 0.2))
        path.addLine(to: CGPoint(x: 0, y: rect.size.height))
        path.addLine(to: CGPoint(x: rect.size.width, y: rect.size.height))
        path.addLine(to: CGPoint(x: path.currentPoint.x, y: self.frame.height * 0.2))
        path.addQuadCurve(to: CGPoint(x: rect.width / 2 + self.frame.width / 6, y: 0), controlPoint: CGPoint(x: rect.width / 2 + rect.width / 6, y: rect.height * 0.2))
        path.close()
        
        layer.path = path.cgPath
        layer.strokeColor = self.colorCamera.cgColor
        layer.fillColor = UIColor.clear.cgColor
        layer.strokeEnd = 0
        
        self.externalLayer = layer
        self.layer.addSublayer(self.externalLayer)
        self.addStrokeAnimation(self.externalLayer, forKey: "external")
    }
    
    private func drawInternalLayer(_ rect: CGRect) {
        let layer = CAShapeLayer()
        let path = UIBezierPath()
    
        let xOffset: CGFloat = rect.width / 2
        let yOffset: CGFloat = rect.height / 2
        path.move(to: CGPoint(x: xOffset, y: yOffset - rect.width / 6))
        for i in 0...360 {
            let radian = CGFloat((360 - i) - 90) * CGFloat.pi / 180.0
            let x = rect.width / 6 * cos(CGFloat(radian))
            let y = rect.width / 6 * sin(CGFloat(radian))
            path.addLine(to: CGPoint(x: x + xOffset, y: y + yOffset))
        }
        
        layer.path = path.cgPath
        layer.strokeColor = self.colorCamera.cgColor
        layer.fillColor = UIColor.clear.cgColor
        layer.strokeEnd = 0
        
        self.internalLayer = layer
        self.layer.addSublayer(self.internalLayer)
        self.addStrokeAnimation(self.internalLayer, forKey: "internal")
    }
    
    private func addStrokeAnimation(_ layer: CAShapeLayer, forKey key: String) {
        let strokeAnimation = CABasicAnimation(keyPath: #keyPath(CAShapeLayer.strokeEnd))
        strokeAnimation.fromValue = layer.strokeEnd
        strokeAnimation.toValue = 1
        strokeAnimation.duration = 0.75
        layer.add(strokeAnimation, forKey: key)
        layer.strokeEnd = 1
    }
}

