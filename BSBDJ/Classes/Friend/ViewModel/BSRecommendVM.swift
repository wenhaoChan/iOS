//
//  BSRecommendVM.swift
//  BSBDJ
//
//  Created by zero on 2018/1/3.
//  Copyright © 2018年 zero. All rights reserved.
//

import UIKit
import Alamofire

class BSRecommendVM {

    lazy var categroys = [BSRecommendCategoryModel]()
    fileprivate var userModelTmpDic = [String: String]()
    
    func getCategroyData(jsonBlock: @escaping ()->()) {
        let parameters = ["a":"category", "c": "subscribe"]
        let urlString = "http://api.budejie.com/api/api_open.php"
        Alamofire.request(urlString, method: .get, parameters: parameters).responseJSON { (respond) in
            switch respond.result{
                case.success(let value):
                    guard let r_dicts = value as? [String : Any] else{return}
                    let dicts = r_dicts["list"] as? [[String : Any]]
                    guard let list = dicts else {
                        return
                    }
                    for dict in list{
                        let category = BSRecommendCategoryModel(dict: dict)
                        self.categroys.append(category)
                    }
                    jsonBlock()
                case.failure:
                    print("failure")
            }
        }
    }
    
    func getUserData(categroy: BSRecommendCategoryModel, jsonBlock: @escaping()->()) {
        if !categroy.canLoadMore {
            jsonBlock()
            return
        }
        
        categroy.currentPage += 1
        
        let urlString = "http://api.budejie.com/api/api_open.php"
        let parameters = ["a":"list", "c": "subscribe", "category_id": "\(categroy.ID)", "page":"\(categroy.currentPage)"]
        userModelTmpDic = parameters
        
        Alamofire.request(urlString, method: .get, parameters: parameters).responseJSON { (respond) in
            if self.userModelTmpDic != parameters {
                return
            }
            switch respond.result{
            case .success(let value):
                guard let r_dicts = value as? [String : Any] else {
                    return
                }
                categroy.total_Count = (r_dicts["total"] as? Int) ?? 0
                let dicts = r_dicts["list"] as? [[String : Any]]
                guard let lists = dicts else {
                    return
                }
                for dict in lists {
                    let user = BSRecommendUserModel(dict: dict)
                    categroy.users.append(user)
                }
                print("catagroy.users.count=\(categroy.users.count)  catagroy.total_Count=\(categroy.total_Count)")
                if categroy.users.count >= categroy.total_Count {
                    categroy.canLoadMore = false
                }
                jsonBlock()
            case.failure:
                categroy.currentPage -= 1
            }
        }
    }
    
}
