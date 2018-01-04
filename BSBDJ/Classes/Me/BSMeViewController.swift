//
//  BSMeViewController.swift
//  BSBDJ
//
//  Created by zero on 2017/12/26.
//  Copyright © 2017年 zero. All rights reserved.
//

import UIKit

let cellId = "MeCellId"

class BSMeViewController: BSBaseViewController {

    lazy var tableView: UITableView = { [weak self] in
        let tableView = UITableView(frame: (self?.view.bounds)!, style: .plain)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = UIColor(242, 242, 242, 1.0)
        tableView.estimatedRowHeight = 0;
        tableView.estimatedSectionHeaderHeight = 0;
        tableView.estimatedSectionFooterHeight = 0;
        let tableViewFooter = BSMeFooterView()
        tableViewFooter.finishedBlock = {
            tableView.reloadData()
        }
        tableView.tableFooterView = tableViewFooter
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
        return tableView
        }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        // Do any additional setup after loading the view.
        
    }

}

extension BSMeViewController {
    
    fileprivate func setupUI() {
        title = "我"
        view.addSubview(tableView)
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: "mine-setting-icon", highImage: "mine-setting-icon-click", target: self, action: #selector(leftItemClicked))
    }
    
    @objc fileprivate func leftItemClicked() {
        print("点击了顶部按钮")
    }
    
}

extension BSMeViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return section != 0 ? 0 : 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: cellId)
        if cell == nil {
            cell = UITableViewCell.init(style: .default, reuseIdentifier: cellId)
        }
        cell?.selectionStyle = .none
        if indexPath.section == 0 {
            cell?.textLabel?.text = "登录/注册"
        }
        return cell!
    }
    
}

extension BSMeViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
       
        return section == 0 ? 0.001: 10
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 0 && indexPath.row == 0 {
            let vc = BSLoginViewController()
            present(vc, animated: true, completion: nil)
        }
    }
    
}


