//
//  MenuView.swift
//  CoreAnimationTrain
//
//  Created by Влад Свиридов on 30/06/2019.
//  Copyright © 2019 Vladislav Sviridov. All rights reserved.
//

import UIKit

class MenuView: UIView {
    
    @IBOutlet weak var tableView: UITableView!
    private var cellObject: [MenuCellObject] = []
    
    init(cellObject: [MenuCellObject], frame: CGRect) {
        super.init(frame: frame)
        self.cellObject = cellObject
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    private func setupInitState() {
        self.tableView.dataSource = self
        self.tableView.delegate = self
    }
}

extension MenuView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.cellObject.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = MenuCell()
        return cell
    }
    
}

extension MenuView: UITableViewDelegate {
}
