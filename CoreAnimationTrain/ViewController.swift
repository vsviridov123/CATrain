//
//  ViewController.swift
//  CoreAnimationTrain
//
//  Created by Владислав Свиридов on 17/06/2019.
//  Copyright © 2019 Vladislav Sviridov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private var menu: MenuView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //self.example()
        self.exampleMenu()
    }
    
    func example() {
        let popupButton = PopupButton(frame: CGRect(origin: .zero, size: CGSize(width: 50, height: 50)))
        popupButton.center = self.view.center
        let circularView = CircularWavesEffectView(innerView: popupButton, withDisplacement: CGPoint(x: 50, y: 50), innerAnimation: popupButton.startAnimation, backgroundViewAnimation: nil)
        self.view.addSubview(circularView)
        self.view.backgroundColor = .black
    }
    
    func exampleMenu()  {
        let frameIcon = CGRect(x: 0, y: 0, width: 30, height: 20)
        let cellObject1 = MenuViewCellObject.init(name: "Camera", icon: CameraIcon.getCameraIcon(frame: frameIcon, color: .white))
        let cellObject2 = MenuViewCellObject.init(name: "Camera", icon: CameraIcon.getCameraIcon(frame: frameIcon, color: .white))
        let cellObject3 = MenuViewCellObject.init(name: "Camera", icon: CameraIcon.getCameraIcon(frame: frameIcon, color: .white))
        let cellObject4 = MenuViewCellObject.init(name: "Camera", icon: CameraIcon.getCameraIcon(frame: frameIcon, color: .white))
        let cellObject5 = MenuViewCellObject.init(name: "Camera", icon: CameraIcon.getCameraIcon(frame: frameIcon, color: .white))
        let cellObject6 = MenuViewCellObject.init(name: "Camera", icon: CameraIcon.getCameraIcon(frame: frameIcon, color: .white))
        let cellObject7 = MenuViewCellObject.init(name: "Camera", icon: CameraIcon.getCameraIcon(frame: frameIcon, color: .white))
        let menu = MenuView(initState: .rolled,
                               value: [.rolled:CGRect(x: self.view.center.x - 25, y: self.view.center.y - 25, width: 50, height: 50),
                                       .normal:CGRect(x: 100, y: 100, width: 200, height: 200)],
                               cellObjects: [cellObject1, cellObject2, cellObject3, cellObject4, cellObject5, cellObject6, cellObject7])
        
        let popupButton = PopupButton(frame: CGRect(origin: .zero, size: CGSize(width: 50, height: 50)))
        popupButton.center = self.view.center
        let circularView = CircularWavesEffectView(innerView: popupButton, withDisplacement: CGPoint(x: 50, y: 50), innerAnimation: popupButton.startAnimation, backgroundViewAnimation: menu.animationRolledFromCurrentState)
        
        self.menu = menu
        self.view.addSubview(menu)
        self.view.addSubview(circularView)
        self.view.backgroundColor = .gray
    }
    
    @objc private func tap(_ sender: UIButton) {
        switch self.menu.state {
        case .normal:
            self.menu.tableView.isHidden = true
            self.menu.popupAnimation(to: .rolled, newFrame: CGRect(x: 200, y: 200, width: 50, height: 50))
            self.menu.tableView.reloadData()
        case .rolled:
            self.menu.popupAnimation(to: .normal, newFrame: CGRect(x:100, y:100, width: 200, height: 200))
            self.menu.tableView.isHidden = false
            self.menu.tableView.reloadData()
        }
        
    }
    
    
}



