//
//  MenuView.swift
//  CoreAnimationTrain
//
//  Created by Влад Свиридов on 30/06/2019.
//  Copyright © 2019 Vladislav Sviridov. All rights reserved.
//

import UIKit

fileprivate enum Constants {
    static var menuCellIdentifier = "menuCellIdentifier"
}

class MenuView: UIView {

    @IBOutlet var contentView: UIView!
    @IBOutlet weak var tableView: UITableView!
    
    public enum MenuViewState {
        case rolled
        case normal
    }
    public var state: MenuViewState = .normal {
        didSet {
            switch self.state {
            case .rolled:
                self.tableView.isHidden = true
            case .normal:
                self.tableView.isHidden = false
            }
        }
    }
    
    private var cellObject: [MenuViewCellObject]!
    private var withStartAnimation: Bool = true
    
    init(cellObjects: [MenuViewCellObject], frame: CGRect) {
        super.init(frame: frame)
        self.cellObject = cellObjects
        self.setupInitState()
    }
    
    private func setupInitState() {
        let nib = UINib(nibName: "MenuView", bundle: nil)
        nib.instantiate(withOwner: self, options: nil)
        self.contentView.frame = self.bounds
        self.addSubview(self.contentView)
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        let cell = UINib(nibName: "MenuViewCell", bundle: nil)
        self.tableView.register(cell, forCellReuseIdentifier: Constants.menuCellIdentifier)
        self.tableView.backgroundColor = UIColor.clear
        self.tableView.rowHeight = UITableView.automaticDimension
        self.tableView.separatorColor = .clear
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setupInitState()
    }
}

extension MenuView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.cellObject.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return tableView.dequeueReusableCell(withIdentifier: Constants.menuCellIdentifier, for: indexPath)
    }
}

extension MenuView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        guard let menuCell = cell as? MenuViewCell else { return }
        menuCell.configure(cellObject: self.cellObject[indexPath.row])
        if withStartAnimation {
            menuCell.startCellAnimation(0.1 * Double(indexPath.row))
        }
    }
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        self.withStartAnimation = false
    }
}


