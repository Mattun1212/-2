//
//  CustomHeaderFooterViewController.swift
//  ぽけメモ2
//
//  Created by マツシタ コウタロウ on 2016/12/01.
//  Copyright © 2016年 マツシタ コウタロウ. All rights reserved.
//

import UIKit

class CustomHeaderFooterView: UITableViewHeaderFooterView {
    private var arrow = UIImageView()
    var section: Int = 0
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        self.arrow.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.addSubview(self.arrow)
        self.contentView.addConstraints([
            NSLayoutConstraint(item: arrow, attribute: .Trailing, relatedBy: .Equal, toItem: self.contentView, attribute: .Trailing, multiplier: 1.0, constant: -8),
            NSLayoutConstraint(item: arrow, attribute: .CenterY, relatedBy: .Equal, toItem: self.contentView, attribute: .CenterY, multiplier: 1.0, constant: 0)])
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setExpanded(expanded: Bool) {
        arrow.image = UIImage(named: expanded ? "ArrowUp" : "ArrowDown")
    }
}