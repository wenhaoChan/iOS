//
//  BSRecommendUserModel.swift
//  BSBDJ
//
//  Created by zero on 2018/1/3.
//  Copyright © 2018年 zero. All rights reserved.
//

import UIKit

class BSRecommendUserModel: NSObject {

    var header: String = ""
    var fans_count: Int = 0
    var screen_name: String = ""
    
    init(dict: [String : Any]) {
        super.init()
        
        guard let header =  dict["header"] as? String, let fans_count = dict["fans_count"] as? Int, let screen_name = dict["screen_name"] as? String  else {
            return
        }
        self.header = header
        self.fans_count = fans_count
        self.screen_name = screen_name
    }
}
