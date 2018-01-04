//
//  BSMeFooterModel.swift
//  BSBDJ
//
//  Created by zero on 2017/12/28.
//  Copyright © 2017年 zero. All rights reserved.
//

import UIKit

class BSMeFooterModel: NSObject {
    var icon = ""
    var name = ""
    var url = ""
    init(_ dic: [String: Any]) {
        guard let name = dic["name"] as? String, let icon = dic["icon"] as? String, let url = dic["url"] as? String else {
            return
        }
        self.name = name
        self.icon = icon
        self.url = url
    }
}
