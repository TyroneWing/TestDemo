//
//  监听属性的改变.swift
//  01-swift基础语法
//
//  Created by __liangdahong on 16/8/30.
//  Copyright © 2016年 https://github.com/asiosldh/. All rights reserved.
//

import Foundation

class BMPerson1: NSObject {
    
    var name: String? {
        // 将要改变时
        willSet{
            print(newValue)
        }
        // 已经改变时
        didSet{
            print(oldValue)
        }
    }

    
    private var newAge = 0
    var age: Int {
        get{
            print("get func")
            return newAge
        }
        set{
            newAge = newValue
            print("set \(newValue)")
        }
    }
}