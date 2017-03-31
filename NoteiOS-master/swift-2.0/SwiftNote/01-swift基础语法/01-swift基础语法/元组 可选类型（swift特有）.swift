//
//  元组 可选类型（swift特有）.swift
//  01-swift基础语法
//
//  Created by ___liangdahong on 16/8/30.
//  Copyright © 2016年 https://github.com/asiosldh/. All rights reserved.
//

import Foundation

func myOptionalTuple() -> () {
    
    // 1.元组
    let info = ("ldh", 100, 2.0)
    info.0
    info.1
    info.2
    
    let info1 = (name: "ldh", age: 100, height: 2.0)
    info1.0
    info1.name
    info1.age
    
    let (name,age) = ("ldh", 100)
    name
    age

    // 2.可选类型
    // var name1: String = nil 错误
    // var name1: Optional<String> = nil;
    var name1: String? = nil

    // 2 解包 非常危险 可能崩溃
    name1 = "1"
    print(name1!)
    if name1 != nil {
        print(name1!)
        print(name1!)
        print(name1!)
        print(name1!)
        print(name1!)
    }
    if let tempName = name1 {
        print(tempName)
    }
    if let name1 = name1 {
        print(name1)
    }

    // 返回的是可选类型（可能为nil的类型）
    var url1 = NSURL.init(string: "")
    
    // 自定义了一个 f可选类型
    var url2: NSURL
    
    // 会报类型不同的产物 url2 = url1
     url2 = url1! // 强制直接解包有安全隐患
    if url1 != nil {url2 = url1!}     // 判断解包
    if let url1 = url1 {url2 = url1}  // 优化的判断解包
    var url = NSURL.init(string: "")
    if let url = url {
        var res = NSURLRequest.init(URL: url)
    }
    
    func a(){
        var obj: AnyObject?  = NSObject()
        
        // 解包1
        obj!.attributeKeys
        
        // 解包2
        if let obj = obj {
            obj.attributeKeys
        }

        // 解包3
        obj?.attributeKeys
    }
}















































