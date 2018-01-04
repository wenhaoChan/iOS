//
//  BSMeFooterViewModel.swift
//  BSBDJ
//
//  Created by zero on 2017/12/28.
//  Copyright © 2017年 zero. All rights reserved.
//

import UIKit
import Alamofire

class BSMeFooterViewModel {

    class func loadMeFooterData(_ finishedBlock: @escaping (_ dataArray: [BSMeFooterModel])->()) {
        let urlString = "http://api.budejie.com/api/api_open.php"
        let parameter = [ "a": "square","c": "topic",]
        Alamofire.request(urlString, method: .get, parameters: parameter).responseJSON { (respond) in
            guard let dic = respond.result.value as? [String: Any]  else{
                return
            }
            guard let datas = dic["square_list"] as? [[String: Any]] else {
                return
            }
            var meFootViewModels = [BSMeFooterModel]()
            for dic in datas {
                let model = BSMeFooterModel(dic)
                meFootViewModels.append(model)
            }
            finishedBlock(meFootViewModels)
        }
    }
    
}
