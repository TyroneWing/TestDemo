//
//  BMPerson.swift
//  01一般用法
//
//  Created by ___liangdahong on 16/9/8.
//  Copyright © 2016年 https://github.com/asiosldh/. All rights reserved.
//

import UIKit

enum Sex {
    case Man,Woman,Other
}

enum Grade: String {
    case Primary
    case Intermediate
    case Advanced
}

class BMPerson: NSObject {
    var name: String!
    var age = 0
    var sex = Sex.Other
    var grade = Grade.Primary

    func test1() -> Void {
        self.grade = .Advanced
        self.sex = .Other
    }
}
