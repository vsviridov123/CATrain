//
//  CameraView.swift
//  CoreAnimationTrain
//
//  Created by Владислав Свиридов on 27/06/2019.
//  Copyright © 2019 Vladislav Sviridov. All rights reserved.
//

import UIKit

class CameraIcon {
    
    static func getCameraIcon(frame: CGRect, color: UIColor) -> Icon {
        return Icon(frame: frame, layers: self.draw(frame: frame, color: color))
    }
    
    private static func draw(frame: CGRect, color: UIColor) -> [CAShapeLayer] {
        return [
            self.drawInternalLayer(frame, color),
            self.drawExternalLayer(frame, color)
        ]
    }
    
    private static func drawExternalLayer(_ rect: CGRect, _ color: UIColor) -> CAShapeLayer{
        let layer = CAShapeLayer()
        let path = UIBezierPath()
        path.lineJoinStyle = .round
        
        // Примерное отношение размеров
        path.move(to: CGPoint(x: rect.width / 2, y: 0))
        path.addLine(to: path.currentPoint.offset(x: -rect.width / 6, y: 0))
        path.addQuadCurve(to: CGPoint(x: 0, y: 0).offset(x: 0, y: rect.height * 0.2), controlPoint: path.currentPoint.offset(x: 0, y: rect.height * 0.2))
        path.addLine(to: CGPoint(x: 0, y: rect.size.height))
        path.addLine(to: CGPoint(x: rect.size.width, y: rect.size.height))
        path.addLine(to: CGPoint(x: path.currentPoint.x, y: rect.height * 0.2))
        path.addQuadCurve(to: CGPoint(x: rect.width / 2 + rect.width / 6, y: 0), controlPoint: CGPoint(x: rect.width / 2 + rect.width / 6, y: rect.height * 0.2))
        path.close()
        
        layer.path = path.cgPath
        layer.strokeColor = color.cgColor
        layer.fillColor = UIColor.clear.cgColor
        layer.strokeEnd = 0
        
        return layer
    }
    
    private static func drawInternalLayer(_ rect: CGRect, _ color: UIColor) -> CAShapeLayer {
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
        layer.strokeColor = color.cgColor
        layer.fillColor = UIColor.clear.cgColor
        layer.strokeEnd = 0
        
        return layer
        
    }
}

