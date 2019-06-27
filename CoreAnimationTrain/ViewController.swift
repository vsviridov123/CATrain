//
//  ViewController.swift
//  CoreAnimationTrain
//
//  Created by Владислав Свиридов on 17/06/2019.
//  Copyright © 2019 Vladislav Sviridov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.example()
        self.exampleIcon()
    }
    
    func example() {
        let popupButton = PopupButton(frame: CGRect(origin: .zero, size: CGSize(width: 50, height: 50)))
        popupButton.center = self.view.center
        let circularView = CircularWavesEffectView(innerView: popupButton, withDisplacement: CGPoint(x: 50, y: 50), innerAnimation: popupButton.startAnimation)
        self.view.addSubview(circularView)
        self.view.backgroundColor = .black
    }
    
    func exampleIcon() {
        let camera = CameraView(frame: CGRect(x: 50, y: 50, width: 100, height: 75))
        self.view.addSubview(camera)
    }
}

