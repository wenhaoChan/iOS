//
//  BSRecommendCategoryModel.swift
//  BSBDJ
//
//  Created by zero on 2018/1/3.
//  Copyright © 2018年 zero. All rights reserved.
//

import UIKit

class BSRecommendCategoryModel: NSObject {
    var count : Int = 0
    var ID: Int = 0
    var name = ""
    var users: [BSRecommendUserModel] = [BSRecommendUserModel]()
    var currentPage = 0
    var total_Count = 0
    var canLoadMore:Bool = true
    init(dict: [String: Any]) {
        guard let count = dict["count"] as? Int, let ID = dict["id"] as? Int, let name = dict["name"] as? String else {
            return
        }
        self.name = name
        self.ID = ID
        self.count = count
    }
}
