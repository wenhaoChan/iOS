//
//  BSTabBar.swift
//  BSBDJ
//
//  Created by zero on 2017/12/26.
//  Copyright © 2017年 zero. All rights reserved.
//

import UIKit

class BSTabBar: UITabBar {

    lazy var publishButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setBackgroundImage(UIImage(named: "tabBar_publish_icon"), for: .normal)
        button.setBackgroundImage(UIImage(named: "tabBar_publish_click_icon"), for: .highlighted)
        button.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
        button.addTarget(self, action: #selector(clickPublishButton), for: .touchUpInside)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(publishButton)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
//        if UIScreen.main.bounds.height == 812 {
//            if frame.origin.y < UIScreen.main.bounds.height - 83 {
//                frame.origin.y = UIScreen.main.bounds.height - 83;
//            }
//        }

        
        let btnW = zc_width / 5
        let btnH = zc_height
        let btnY: CGFloat = 0
        var index: CGFloat = 0
        publishButton.center = zc_center
        for view in subviews {
            if view.isKind(of: NSClassFromString("UITabBarButton")!){
                let buttonX = (index < 2) ? index * btnW : (index + 1) * btnW
                view.frame = CGRect(x: buttonX, y: btnY, width: btnW, height: btnH)
                index += 1
            }
        }
    }

}

extension BSTabBar {
    @objc fileprivate func clickPublishButton() {
        
    }
}
