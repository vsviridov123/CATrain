//
//  CircularWavesEffectView.swift
//  CoreAnimationTrain
//
//  Created by Владислав Свиридов on 21/06/2019.
//  Copyright © 2019 Vladislav Sviridov. All rights reserved.
//

import UIKit

public class CircularWavesEffectView: UIView, UIViewSimpleAnimation {
    
    private var state: Bool = true
    private var effectView: PressedEffectView!
    private var offset: CGPoint!
    private var innerAnimation: () -> () = {}
    private var backgroundViewAnimaiton: () -> () = {}
    
    public var durationAnimation: Double = 0.5
    public var innerView: UIView!
    
    /**
    Create custom view with circular waves effect.
     - Parameter innerView: This is the view on which the effect is applied.
     - Parameter withDisplacement: This is the view offset by clicking on the specified CGPoint.
     - Parameter innerAnimation: This is the animation of innerView
     - Parameter backgroundViewAnimation: This is the animation of backgroundView
     */
    init(innerView: UIView, withDisplacement: CGPoint?, innerAnimation: (()->())?, backgroundViewAnimation: ( ()->() )? ) {
        super.init(frame: innerView.frame)
        self.innerView = innerView
        self.offset = withDisplacement ?? .zero
        if let animation = innerAnimation {
            self.innerAnimation = animation
        }
        if let backAnimation = backgroundViewAnimation {
            self.backgroundViewAnimaiton = backAnimation
        }
        
        self.innerView.frame.origin = .zero
        self.effectView = PressedEffectView(center: self.innerView.center, radius: self.innerView.frame.width)
        let tap = UITapGestureRecognizer(target: self, action: #selector(startAnimating))
        self.effectView.addGestureRecognizer(tap)
        self.addSubview(self.innerView)
        self.addSubview(self.effectView)
        
        self.clipsToBounds = false
        self.backgroundColor = .clear
        self.effectView.delegate = self
    }
    
    
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    @objc private func startAnimating() {
        self.effectView.startAnimation()
    }
    
    func startAnimation() {
        self.animationFrame()
        self.innerAnimation()
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
        
        UIView.animate(withDuration: self.durationAnimation, delay: 0, options: .curveEaseIn, animations: {
            self.frame.origin = offsetView
        }) { (finish) in
            if finish {
                self.state.toggle()
                self.backgroundViewAnimaiton()
            }
        }
    }
}

extension CircularWavesEffectView: PressedEffectViewDelegate {
    // start default animation from protocol
}
