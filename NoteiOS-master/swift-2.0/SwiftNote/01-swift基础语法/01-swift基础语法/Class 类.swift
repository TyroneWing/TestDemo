//
//  Class 类.swift
//  01-swift基础语法
//
//  Created by __liangdahong on 16/8/30.
//  Copyright © 2016年 https://github.com/asiosldh/. All rights reserved.
//

import Foundation

class BMPerson {
    
}

class Person: NSObject {
    var name = String?()
    
    // 类的属性处理
    // 1 存储属性
    // 2 计算属性
    // 3 类属性
    
    // 1.
    var age: Int = 0
    var name1: String?
    var name2: String!
    
    // 2.计算属性 j=简单使用
    var ave: Int {
        return 1
    }
    
    // 3.类属性
    static var cours: Int = 0;
    
    // 系统自动调super
    override init() {
        age = 1;
    }
    
    // 系统自动调super
    init(age: Int, name: String) {
        self.age = age
        self.name = name
    }
    
    init(dict: Dictionary<String, AnyObject>) {
        
        // SWIFT 一般的init 方法不需要调 super.init (因为系统会自动调用)
        // 但有一些特殊情况需要自己调用
        super.init()
        self.setValuesForKeysWithDictionary(dict)
    }

    // 和oc的kvc设值也可以防止崩溃
    override func setValue(value: AnyObject?, forUndefinedKey key: String) {}
}

func personFunc() -> () {
    let p = Person();
    p.setValue("", forKey: "")
    p.setValue("", forKeyPath: "name.aa")
    p.setValuesForKeysWithDictionary(["name": "1","name1": "1"])
    Person.cours = 0;
}





























