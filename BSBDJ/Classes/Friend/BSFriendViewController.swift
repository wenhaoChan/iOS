//
//  BSFriendViewController.swift
//  BSBDJ
//
//  Created by zero on 2017/12/26.
//  Copyright © 2017年 zero. All rights reserved.
//

import UIKit

class BSFriendViewController: BSBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let loginButton :UIButton = UIButton(type: .custom)
        loginButton.frame = CGRect(x: 20, y: 64 + 20, width: 100, height: 20)
        loginButton.setTitle("登录／注册", for: .normal)
        loginButton.backgroundColor = UIColor.blue
        loginButton.addTarget(self, action: #selector(clickLoginButton), for: .touchUpInside)
        self.view.addSubview(loginButton)
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: "friendsRecommentIcon", highImage: "friendsRecommentIcon-click", target: self, action: #selector(tagClick))
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

extension BSFriendViewController {
    
    @objc fileprivate func clickLoginButton() {
        let vc = BSLoginViewController()
        present(vc, animated: true, completion: nil)
    }
    
    @objc fileprivate func tagClick() {
        let vc = BSRecommendViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
}
