//
//  ViewController.swift
//  SwiftClosure
//
//  Created by ___liangdahong on 16/9/9.
//  Copyright © 2016年 https://github.com/asiosldh/. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let btn = UIButton.init(frame: CGRectMake(100, 100, 100, 100))
        btn.backgroundColor = UIColor.orangeColor()
        self.view.addSubview(btn)
        btn.ih_addTouchUpInsideClosure { 
            print("1")
        }
        btn.ih_addTouchUpInsideClosure {
            print("2")
        }
    }
}



