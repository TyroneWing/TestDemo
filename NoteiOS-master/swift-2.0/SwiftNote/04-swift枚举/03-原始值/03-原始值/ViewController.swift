//
//  ViewController.swift
//  03-原始值
//
//  Created by ___liangdahong on 16/9/8.
//  Copyright © 2016年 https://github.com/asiosldh/. All rights reserved.
//

import UIKit

/*!
原始值可以为多种类型
 String， Int，Double
 enum 可以像类一样的创
 */
enum BMCode: String {
    case QRCode = "1"
    case BarCode = "2"
}

enum BMColor: Int {
    case Red = 1
    case Bulue = 2
}

enum BMTestType: Double {
    case type1 = 1.1
    case type2 = 2.22
}

class ViewController: UIViewController {

    var ty: BMTestType!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.ty = BMTestType.type1
        if let typ = self.ty {
        print(typ.rawValue)
        }

        if let ty = BMTestType.init(rawValue: 1.1) {
            print(ty.rawValue)
        }
    }
}

