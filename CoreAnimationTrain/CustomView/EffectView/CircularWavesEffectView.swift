//
//  CircularWavesEffectView.swift
//  CoreAnimationTrain
//
//  Created by Владислав Свиридов on 21/06/2019.
//  Copyright © 2019 Vladislav Sviridov. All rights reserved.
//

import UIKit

public class CircularWavesEffectView: UIView {
    
    private var state: Bool = true
    private var effectView: PressedEffectView!
    private var offset: CGPoint!
    
    public var durationAnimation: Double = 1.0
    public var innerView: UIView!
    
    /**
     Create custom view with circular waves effect
     :param: innerView This is the view on which the effect is applied
     :param: withDisplacement This is the view offset by clicking on the specified CGPoint
    */
    init(innerView: UIView, withDisplacement: CGPoint?) {
        super.init(frame: innerView.frame)
        self.innerView = innerView
        
        self.offset = withDisplacement ?? .zero
        let tap = UITapGestureRecognizer(target: self, action: #selector(startAnimating))
        self.innerView.addGestureRecognizer(tap)
        
        self.innerView.frame.origin = .zero
        self.effectView = PressedEffectView(center: self.innerView.center, radius: self.innerView.frame.width)
        self.addSubview(self.effectView)
        self.addSubview(self.innerView)
        
        self.clipsToBounds = false
        self.backgroundColor = .clear
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    @objc private func startAnimating() {
        animationFrame()
        if let view = self.innerView as? PopupButton {
            view.startAnimation()
        }
        self.effectView.startAnimation()
    }
    
    private func animationFrame() {
        if self.offset == .zero {
            return
        }
        var offsetView: CGPoint!
        if self.state {
            offsetView = self.frame.origin.offset(x: self.offset.x, y: self.offset.y)
        } else {
            offsetView = self.frame.origin.offset(x: -self.offset.x, y: -self.offset.y)
        }
        
        UIView.animate(withDuration: self.durationAnimation, animations: {
            self.frame.origin = offsetView
        }) { (finish) in
            if finish {
                self.state.toggle()
            }
        }
    }
}
