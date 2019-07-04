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
    @IBOutlet weak var bottomContraintName: NSLayoutConstraint!
    
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
//        self.bottomContraintName.constant = -20.0
        self.cellObject = cellObject
        self.name.backgroundColor = .white 
    }
    
    public func startCellAnimation(_ offset: Double) {
        cellObject.icon.timeOffset = offset
        cellObject.icon.startAnimation()
        UIView.animate(withDuration: cellObject.icon.duration * 0.25,
                       delay: offset + cellObject.icon.duration * 0.75,
                       options: .curveEaseOut,
                       animations: {
                        self.frame = self.frame.offsetBy(dx: -10, dy: 10)
//                        self.bottomContraintName.constant = 10
        }) { (finish) in
            // empty
        }
    }
}
