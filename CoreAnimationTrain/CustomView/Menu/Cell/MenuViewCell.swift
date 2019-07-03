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
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(cellObject: MenuViewCellObject) {
        self.name.text = cellObject.name
        self.iconView = cellObject.icon
        
        self.bottomContraintName.constant = -20.0
        self.cellObject = cellObject
    }
    
    public func startCellAnimation(_ offset: Double) {
        cellObject.icon.timeOffset = offset
        cellObject.icon.startAnimation() 
        UIView.animate(withDuration: cellObject.icon.duration * 0.25,
                       delay: offset + cellObject.icon.duration * 0.75,
                       options: .curveEaseOut,
                       animations: {
                        self.bottomContraintName.constant = 10
        }) { (finish) in
            // empty
        }
    }
}
