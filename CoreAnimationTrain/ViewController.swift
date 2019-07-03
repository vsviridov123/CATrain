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
        //self.example()
        //self.exampleIcon()
        self.exampleMenu()
    }
    
    func example() {
        let popupButton = PopupButton(frame: CGRect(origin: .zero, size: CGSize(width: 50, height: 50)))
        popupButton.center = self.view.center
        let circularView = CircularWavesEffectView(innerView: popupButton, withDisplacement: CGPoint(x: 50, y: 50), innerAnimation: popupButton.startAnimation)
        self.view.addSubview(circularView)
        self.view.backgroundColor = .black
    }
    
    func exampleIcon() {
        let frame = CGRect(x: 50, y: 50, width: 30, height: 20)
        let camera = CameraIcon.getCameraIcon(frame: frame, color: .white)
        camera.startAnimation()
        self.view.addSubview(camera)
        
    }
    
    func exampleMenu()  {
        let frameIcon = CGRect(x: 50, y: 50, width: 30, height: 20)
        let cellObject1 = MenuViewCellObject.init(name: "Camera", icon: CameraIcon.getCameraIcon(frame: frameIcon, color: .white))
        let cellObject2 = MenuViewCellObject.init(name: "Camera", icon: CameraIcon.getCameraIcon(frame: frameIcon, color: .white))
        let cellObject3 = MenuViewCellObject.init(name: "Camera", icon: CameraIcon.getCameraIcon(frame: frameIcon, color: .white))
        let menu = MenuView(cellObjects: [cellObject1, cellObject2, cellObject3], frame: CGRect(x: 50, y: 50, width: 200, height: 200))
        self.view.addSubview(menu)
    }
}

