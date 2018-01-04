//
//  BSCategroyTableViewCell.swift
//  BSBDJ
//
//  Created by zero on 2018/1/3.
//  Copyright © 2018年 zero. All rights reserved.
//

import UIKit

class BSCategroyTableViewCell: UITableViewCell {

    @IBOutlet weak var categoryLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        categoryLabel.adjustsFontSizeToFitWidth = true
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        if selected {
            categoryLabel.textColor = .red
        } else {
            categoryLabel.textColor = .lightGray
        }
        // Configure the view for the selected state
    }
    
    var model: BSRecommendCategoryModel! {
        didSet{
            categoryLabel.text = model.name
        }
    }
    
}
