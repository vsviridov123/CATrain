//
//  PopupButton.swift
//  CoreAnimationTrain
//
//  Created by Владислав Свиридов on 17/06/2019.
//  Copyright © 2019 Vladislav Sviridov. All rights reserved.
//

import UIKit

class PopupButton: UIView, PressedEffectViewDelegate {
    
    private enum State {
        case normal
        case pressed
    }
    private var state:State = State.normal
    
    lazy var sendLayer: CAShapeLayer = {
        var shapeLayer = CAShapeLayer()
        let path = UIBezierPath()
        
        path.move(to: CGPoint.zero)
        path.addLine(to: path.currentPoint.offset(x: 0, y: 20))
        path.addLine(to: path.currentPoint.offset(x: -10, y: 2.5))
        path.close()
        path.addLine(to: path.currentPoint.offset(x: 10, y: 22.5))
        path.addLine(to: path.currentPoint.offset(x: -10, y: -2.5))
        
        shapeLayer.path = path.cgPath
        shapeLayer.strokeColor = UIColor.white.cgColor
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.position = self.center.offset(x: 10, y: -10)
        shapeLayer.anchorPoint = shapeLayer.position
        let radian = (45.0 * CGFloat.pi) / 180
        shapeLayer.transform = CATransform3DRotate(shapeLayer.transform, radian, 0, 0, 1)
            
        return shapeLayer
    }()
    
    lazy var closeLayer: CAShapeLayer = {
        var shapeLayer = CAShapeLayer()
        let path = UIBezierPath()
        
        path.move(to: CGPoint.zero)
        path.addLine(to: path.currentPoint.offset(x: 7.5, y: 7.5))
        path.move(to: path.currentPoint.offset(x: 0, y: -15))
        path.addLine(to: path.currentPoint.offset(x: -15, y: 15))
        path.move(to: path.currentPoint.offset(x: 0, y: -15))
        path.addLine(to: path.currentPoint.offset(x: 7.5, y: 7.5))
        
        shapeLayer.path = path.cgPath
        shapeLayer.strokeColor = UIColor.white.cgColor
        shapeLayer.fillColor = UIColor.clear.cgColor
        let translationStep = sqrtf(15.0 * 15.0) / 2
        shapeLayer.position = self.center
        shapeLayer.anchorPoint = shapeLayer.position
        shapeLayer.transform = CATransform3DScale(shapeLayer.transform, 0.1, 0.1, 0.1)
        
        return shapeLayer
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupInitState()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setupInitState()
    }
    
    private func setupInitState() {
        self.backgroundColor = UIColor.clear
        
        self.layer.cornerRadius = self.frame.width / 2
        self.layer.backgroundColor = UIColor(red: 244.0 / 255,
                                             green: 85.0 / 255,
                                             blue: 128.0 / 255,
                                             alpha: 1).cgColor
        
        self.layer.addSublayer(self.sendLayer)
        self.layer.addSublayer(self.closeLayer)
        self.layer.masksToBounds = true
    }
    
    private func beginAnimation() {
        self.sendAnimation(state: self.state)
        self.closeAnimation(state: self.state)
        self.state = self.state == .normal ? .pressed : .normal
    }
    
    private func sendAnimation(state: State)  {
        let animation = CABasicAnimation(keyPath: #keyPath(CALayer.position))
        animation.duration = 0.5
        animation.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
        animation.fromValue = self.sendLayer.position
        animation.toValue = self.sendLayer.position.offset(x: 50, y: -50)
        switch state {
        case .normal:
            self.sendLayer.position = self.sendLayer.position.offset(x: -50, y: 50)
        default:
            self.sendLayer.position = self.sendLayer.position.offset(x: 50, y: -50)
        }
        self.sendLayer.add(animation, forKey: "sendAnimation")
    }
    
    private func closeAnimation(state: State) {
        let animationTransform = CABasicAnimation(keyPath: #keyPath(CALayer.transform))
        animationTransform.duration = 0.5
        animationTransform.timingFunction = CAMediaTimingFunction(name: .easeIn)
        animationTransform.fromValue = self.closeLayer.transform
        
        var transform: CATransform3D!
        
        switch state {
        case .normal:
            transform = CATransform3DMakeScale(1, 1, 1)
            transform = CATransform3DRotate(transform, CGFloat.pi, 0, 0, -1)
        default:
            transform = CATransform3DMakeScale(0.1, 0.1, 0.1)
            transform = CATransform3DRotate(transform, 0, 0, 0, 1)
        }
        animationTransform.toValue = transform
        self.closeLayer.transform = transform
        
        self.closeLayer.add(animationTransform, forKey: "closeAnimation")
        
    }
}

extension PopupButton: UIViewSimpleAnimation {
    func startAnimation() {
        self.beginAnimation()
    }
}


