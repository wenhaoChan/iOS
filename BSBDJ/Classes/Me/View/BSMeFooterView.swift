//
//  BSMeFooterView.swift
//  BSBDJ
//
//  Created by zero on 2017/12/28.
//  Copyright © 2017年 zero. All rights reserved.
//

import UIKit
import Kingfisher

class BSMeFooterView: UIView {

    var finishedBlock:(() -> ())?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.white
        loadData()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension BSMeFooterView {
    
    fileprivate func loadData() {
        BSMeFooterViewModel.loadMeFooterData {(models) in
            self.setupButtons(models)
        }
    }
}

extension BSMeFooterView {
    
    fileprivate func setupButtons(_ data: [BSMeFooterModel]) {
        let maxCols: CGFloat = 4
        let buttonW = kScreenWidth / maxCols
        let buttonH = buttonW
        
        for i in 0..<data.count {
            
            let model = data[i]
            let button = UIButton()
            button.setTitle(model.name, for: .normal)
            button.setTitleColor(UIColor.darkGray, for: .normal)
            button.addTarget(self, action: #selector(click(_:)), for: .touchUpInside)
            button.set(image: UIImage(named: ""), title: "文字在下方", titlePosition: .bottom,
                       additionalSpacing: 10.0, state: .normal)
            button.imageView?.frame = CGRect(x: 0, y: 0, width: 25, height: 25)
            button.kf.setImage(with: URL(string: model.icon), for: .normal)
            // 行
            let row = i / Int(maxCols)
            // 列
            let col = CGFloat(i).truncatingRemainder(dividingBy: maxCols)
            let x = col * buttonW
            let y = CGFloat(row) * buttonH
            button.frame = CGRect(x: x, y: y, width: buttonW, height: buttonH)
            addSubview(button)
        }
        
        // 总页数 == (总个数 + 每页的最大数 - 1) / 每页最大数
        let rows = (CGFloat(data.count) + maxCols - 1) / maxCols
        frame = CGRect(x: 0, y: 0, width: kScreenWidth, height: rows * buttonH)
        
        finishedBlock?()
    }
    
    @objc fileprivate func click(_ btn: UIButton){
        
    }
    
}
