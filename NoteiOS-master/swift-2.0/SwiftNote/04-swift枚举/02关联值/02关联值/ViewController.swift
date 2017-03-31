//
//  ViewController.swift
//  02关联值
//
//  Created by ___liangdahong on 16/9/8.
//  Copyright © 2016年 https://github.com/asiosldh/. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    lazy var order: BMOrder = {
        let orde = BMOrder()
        orde.name = "洗衣液"
        orde.orderID = "GZ001"
        orde.code = BMCode.BarCode("BarCode1")
        return orde
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        if let code = self.order.code {
            switch code {
            case BMCode.BarCode(let codeString):
                print("是条形码:"+codeString)
            case BMCode.QRCode(let codeString):
                print("二维码:"+codeString)
            }
        }

        self.order.code = BMCode.QRCode("二维码02")
        if let code = self.order.code {
            switch code {
            case let BMCode.BarCode(codeString):
                print("是条形码:"+codeString)
            case let BMCode.QRCode(codeString):
                print("二维码:"+codeString)
            }
        }
    }
}

