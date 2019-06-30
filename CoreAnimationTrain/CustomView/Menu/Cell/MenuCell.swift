//
//  MenuCell.swift
//  CoreAnimationTrain
//
//  Created by Влад Свиридов on 30/06/2019.
//  Copyright © 2019 Vladislav Sviridov. All rights reserved.
//

import UIKit

class MenuCell: UITableViewCell {
    
    
    @IBOutlet weak var iconView: UIView!
    @IBOutlet weak var name: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configure(cellObject: MenuCellObject) {
        self.iconView = cellObject.iconView
        self.name.text = cellObject.name
    }
    
}
