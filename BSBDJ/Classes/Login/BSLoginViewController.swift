//
//  BSLoginViewController.swift
//  BSBDJ
//
//  Created by zero on 2017/12/27.
//  Copyright © 2017年 zero. All rights reserved.
//

import UIKit

class BSLoginViewController: BSBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func clickLogin(_ sender: Any) {
        
    }
    
    //
    
    @IBAction func dismissLoginViewController(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func clickLoginOtherType(_ sender: Any) {
    }
    
    
}

