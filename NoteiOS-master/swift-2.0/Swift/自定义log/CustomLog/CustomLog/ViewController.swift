//
//  ViewController.swift
//  CustomLog
//
//  Created by __liangdahong on 2016/11/1.
//  Copyright © 2016年 http://idhong.com/. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        IHLog("\(self)")
        IHLog("c", file: "a")
        
        let f1 = 1.3213
        print("\(f1)")
        print(String(format: "%.2f  f1 = \(f1)", 10.3))
        print("\(f1.bm_format("%.2f"))")
    }
}

