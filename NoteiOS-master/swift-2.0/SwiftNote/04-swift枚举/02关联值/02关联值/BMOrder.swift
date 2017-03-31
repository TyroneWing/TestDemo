//
//  BMOrder.swift
//  02关联值
//
//  Created by ___liangdahong on 16/9/8.
//  Copyright © 2016年 https://github.com/asiosldh/. All rights reserved.
//

import UIKit

/*!
 枚举类型之关联值
 

 使用关联值的目的是：为一个数据的类型为 枚举类型时，日期还包括了值时，可以使用关联值可以更好的使用
 
 比如： 一个model有一个属性： 
    码的类型（条形码，二维码）
    码的组
 按照常规时 需要有2个属性，一个说明码的类型，一个说明码的组
 
 在swift中可以使用 enum的2关联值声线  如下：
 
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
 
 */
enum BMCode {
    case QRCode(String)
    case BarCode(String)
}


class BMOrder: NSObject {
    var orderID: String!
    var name: String!
    var code: BMCode!
}
