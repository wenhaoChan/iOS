//
//  BSTabBarController.swift
//  BSBDJ
//
//  Created by zero on 2017/12/26.
//  Copyright © 2017年 zero. All rights reserved.
//

import UIKit

class BSTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let tabBar = UITabBarItem.appearance()
        let attrs_Normal = [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 12),
                            NSAttributedStringKey.foregroundColor: UIColor.gray]
        let attrs_Selected = [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 12),
                            NSAttributedStringKey.foregroundColor: UIColor.darkGray]
        tabBar.setTitleTextAttributes(attrs_Normal, for: .normal)
        tabBar.setTitleTextAttributes(attrs_Selected, for: .selected)
        setupUI()
    }
}

extension BSTabBarController {
    
    fileprivate func setupUI() {
        
        setValue(BSTabBar(), forKey: "tabBar")
        
        let vcs:[BSBaseViewController] = [BSEssenceViewController(), BSNewViewController(), BSFriendViewController(), BSMeViewController()]
        let titles = [("精华", "essence"), ("新帖", "new"), ("关注", "friendTrends"), ("我", "me")]
        for (index, vc) in vcs.enumerated() {
            vc.tabBarItem.title = titles[index].0
            vc.tabBarItem.image = UIImage(named: "tabBar_\(titles[index].1)_icon")
            vc.tabBarItem.selectedImage = UIImage(named: "tabBar_\(titles[index].1)_click_icon")
            let nav = UINavigationController(rootViewController: vc)
            addChildViewController(nav)
        }
    }
}














