//
//  BSRecommendViewController.swift
//  BSBDJ
//
//  Created by zero on 2018/1/3.
//  Copyright © 2018年 zero. All rights reserved.
//

import UIKit

fileprivate let categroyCellId = "BSCategroyTableViewCell"
fileprivate let userCellId = "BSUserTableViewCell"

class BSRecommendViewController: UIViewController {

    @IBOutlet weak var categroyTableView: UITableView!
    @IBOutlet weak var userTableView: UITableView!
    
    lazy var recommentVM = BSRecommendVM()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        recommentVM.getCategroyData {[weak self] in
            self?.categroyTableView.reloadData()
            self?.categroyTableView.selectRow(at: IndexPath(row: 0, section:0), animated: false, scrollPosition: .top)
            guard let categoryModel = self?.recommentVM.categroys.first else{return}
            self?.recommentVM.getUserData(categroy: categoryModel, jsonBlock: {
                self?.userTableView.reloadData()
            })
        }
        // Do any additional setup after loading the view.
    }
}

extension BSRecommendViewController {
    
    fileprivate func setupUI() {
        title = "推荐关注"
        categroyTableView.tableFooterView = UIView()
        categroyTableView.register(UINib.init(nibName: categroyCellId, bundle: nil), forCellReuseIdentifier: categroyCellId)
        userTableView.register(UINib.init(nibName: userCellId, bundle: nil), forCellReuseIdentifier: userCellId)
    }
    
}

extension BSRecommendViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == categroyTableView {
            return recommentVM.categroys.count
        }else{
            guard let row = categroyTableView.indexPathForSelectedRow?.row else{
                return 0
            }
            return recommentVM.categroys[row].users.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == categroyTableView {
            let cell = tableView.dequeueReusableCell(withIdentifier: categroyCellId) as! BSCategroyTableViewCell
            cell.model = recommentVM.categroys[indexPath.row]
            return cell
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: userCellId) as! BSUserTableViewCell
            let row = categroyTableView.indexPathForSelectedRow?.row
            let category = recommentVM.categroys[row!]
            let array = category.users
            if array.count > 0 {
                cell.model = array[indexPath.row]
            }
            //在这里校验 是否还能再继续加载避免再次发起请求
            if indexPath.row == category.users.count - 1 && category.canLoadMore{
                recommentVM.getUserData(categroy: recommentVM.categroys[row!], jsonBlock: {
                  self.userTableView.reloadData()
                })
            }
            return cell
        }
    }
    
}

extension BSRecommendViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if tableView == categroyTableView {
            return 40
        }else{
            return 70
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if tableView == categroyTableView {
            let model = recommentVM.categroys[indexPath.row]
            recommentVM.getUserData(categroy: model, jsonBlock: {
                self.userTableView.reloadData()
                self.userTableView.scrollToRow(at: IndexPath(row: 0, section: 0), at: .top, animated: false)
            })
        }else{
            
        }
    }
    
}
