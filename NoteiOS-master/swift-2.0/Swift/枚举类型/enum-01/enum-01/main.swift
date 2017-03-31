//
//  main.swift
//  enum-01
//
//  Created by ___liangdahong on 2016/12/22.
//  Copyright © 2016年 蓝月亮（中国）有限公司. All rights reserved.
//

import Foundation

enum BMPersonType {
    case good, bad
}

enum BlueMoonType {
    case good
    case bad
}

var type1 = BMPersonType.bad
print("\(type1)")
type1 = .good
print("\(type1)")

let type2 = BlueMoonType.good
print("\(type2)")

switch type2 {
case .good:
    print("good")
default: print("default")
}

enum BMCode {
    case upc(NSInteger, NSInteger, NSInteger, NSInteger)
    case code(NSString)
}

let c = BMCode.upc(1, 2, 3, 4)
