//
//  String Array Dictionary.swift
//  01-swift基础语法
//
//  Created by ___liangdahong on 16/8/30.
//  Copyright © 2016年 https://github.com/asiosldh/. All rights reserved.
//

import Foundation

func stringArrayDictionary() -> () {
    
    return;
    
    // MARK: - - String
    // 1 创建字符串
    let str = "string"
    let str111 = String()
    print(str)
    
    // 2 遍历字符串
    for c in str.characters {
        print(c)
    }
    
    // 3 字符串拼接
    let str1 = "1"
    let str2 = "2"
    let str3 = str1 + str2
    print(str3)
    
    
    // 4 字符串log 和各种拼接
    let name = "ldh"
    let age = 20
    let height = 199
    let info = "name\(name) age\(age) height\(height)"
    let min = 20
    let second = 4
    
    // 5.格式化
    let time = String.init(format: "%.2d : %.2d", min,second)
    print("time = \(time)")
    
    // 6.字符串分割
    //time.substringToIndex(<#T##index: Index##Index#>)
    //time.substringWithRange(<#T##aRange: Range<Index>##Range<Index>#>)
    //time.substringFromIndex(<#T##index: Index##Index#>)
    let time1 = (time as NSString).substringFromIndex(1) as String
    print(time1)
    
    
    // MARK: - - Array
    // 1.创建方式
    let array = ["1"]
    let array1: [String] = ["1"]
    let array2: Array = ["1"]
    let array3: Array<String> = ["1"]
    let array4: Array<String>
    array4 = [""]
    let array5: Array<String> = Array()
    let array6 = Array<String>()
    let array7 = [String]()
    let array8 = ["1", 1.0, 1]
    
    
    var muarray = [""]
    muarray.append("1")
    muarray.append("")
    muarray.removeAtIndex(0)
    muarray.removeAll()
    muarray.removeLast()
    muarray.removeFirst()
    // 3.遍历
    for i in 0..<muarray.count {}
    for name in muarray {}
    for i in 0..<2 {}
    for name in muarray[0..<2] {}
    
    // MARK: - - Dictionary
    let dic1 = ["1": ""]
    let dic2 = [String: String]()
    let dic3 = Dictionary<String, String>()
    let dic4 = ["k": "1", "key": 1]
    let dic5 = Dictionary<String, NSObject>()

    var mdict1 = [String: String]()
    var mdict2 = ["key": "a"]
    mdict1["k"] = "1"
    mdict1.count
    var mdict3 = [String: AnyObject]()
    
    mdict1["key11"] = "add"
    mdict1["key11"] = "修改"
    mdict1.removeValueForKey("key11")
    mdict1.removeAll()
    let obj = mdict1["key11"]
    

    for key in mdict1.keys {}
    for v in mdict1.values {}
    for dic in mdict1 {}
    for (key, v) in mdict1 {}

    let d1 = ["1": "2"]
    let d2 = ["2": "kk"]
    // 错误 d1+d2 需要遍历的方式合并dict
}

