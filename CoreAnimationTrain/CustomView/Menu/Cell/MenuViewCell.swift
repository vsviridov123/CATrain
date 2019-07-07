//
//  MenuViewCell.swift
//  CoreAnimationTrain
//
//  Created by Влад Свиридов on 30/06/2019.
//  Copyright © 2019 Vladislav Sviridov. All rights reserved.
//

import UIKit

class MenuViewCell: UITableViewCell {

    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var iconView: UIView!
    
    private var cellObject: MenuViewCellObject!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundColor = UIColor.clear
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configure(cellObject: MenuViewCellObject) {
        self.name.text = cellObject.name
        self.iconView.addSubview(cellObject.icon)
        self.iconView.backgroundColor = .clear
        self.cellObject = cellObject
        self.name.textColor = .white
        let xName = self.iconView.frame.origin.x + self.iconView.frame.width + 20
        let yName = self.frame.height + self.name.frame.height
        self.name.frame.origin = CGPoint(x: xName, y: yName)
        self.layer.masksToBounds = true
        self.name.sizeToFit()
    }
    
    public func startCellAnimation(_ offset: Double) {
        cellObject.icon.timeOffset = offset
        cellObject.icon.startAnimation()
        UIView.animate(withDuration: cellObject.icon.duration * 0.25,
                       delay: offset + cellObject.icon.duration * 0.75,
                       options: .curveEaseOut,
                       animations: {
                         self.name.frame.origin.y = self.iconView.center.y - self.name.frame.height / 2
        }) { (finish) in
            // empty
        }
    }
}
