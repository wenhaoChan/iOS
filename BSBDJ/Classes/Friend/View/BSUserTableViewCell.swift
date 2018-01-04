//
//  BSUserTableViewCell.swift
//  BSBDJ
//
//  Created by zero on 2018/1/3.
//  Copyright © 2018年 zero. All rights reserved.
//

import UIKit

class BSUserTableViewCell: UITableViewCell {

    @IBOutlet weak var myImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var desLabel: UILabel!
    @IBOutlet weak var focusBtn: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    var model: BSRecommendUserModel! {
        didSet{
            myImageView.setHeaderImage(model.header)
            desLabel.text = "\(model.fans_count)"
            titleLabel.text = model.screen_name
        }
    }
    
}
