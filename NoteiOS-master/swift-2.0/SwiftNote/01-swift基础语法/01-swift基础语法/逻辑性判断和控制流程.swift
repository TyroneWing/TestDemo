//
//  逻辑性判断和控制流程.swift
//  01-swift基础语法
//
//  Created by ___liangdahong on 16/8/30.
//  Copyright © 2016年 https://github.com/asiosldh/. All rights reserved.
//

import Foundation

func logicControl() -> () {

    var sel = 1 > 0
    if sel {
        print("is 1")
    }else {
        print("is 0")
    }

    var score = 101
    if score > 100 || score < 0 {
        print("不合理");
    }else{
        print("合理")
    }
    var l  = true ? 1 : 2
    
    func onlinee(age: Int, ID: Bool, maney: Bool) -> () {
        
        guard age > 20 else{
            print("条件不成熟");
            return;
        }
        guard ID else{
            print("条件不成熟");
            return;
        }
        guard maney else{
            print("条件不成熟");
            return;
        }
        print("一起准备OK");
    }
    
    onlinee(100, ID: true, maney: true);
    
    let ss = 100
    // switch 可以不写 break 需要继续时 fallthrough
    switch ss  {
    case 1: print("1")
        fallthrough
    case 2: print("2")
    case 3: print("3")
    case 100,200,300: print("111")
        fallthrough
    default: print("other")
    }
    
    // 各种类型比较
    switch 1.4 {
    case 1.2: print("1.2")
    case 1.0: print("1.0")
    case 1.2,1.4,1.4434: print("ooo")
        fallthrough
    default: print("other")
    }
    
    // 多个
    switch "1" {
    case "222","1": print("222")
    default: print("other")
    }
    
    // 区域比较
    switch 1 {
    case 1..<10:
        print("1..<101..<101..<101..<101..<101..<101..<101..<101..<10")
    default:
        print("")
    }
    
    for index in 0...1 {
        print(index)
    }
    
    0..<10 // [1 10)
    0...10 // [1 10]
    
    for var a = 0; a < 10; a++ {
        print(a)
    }
    
    for index in 1...2 {
        print(index)
    }
    for index in 1..<2 {
        print(index)
    }
    
    for _ in 1...9 {
        print("hi ")
    }
    
    while (false) {
        print("1")
    }
    
    repeat {
    }while(false)

    print("学习情况： \(otherWithScr(60.1))")
}


func otherWithScr(scr: Double) -> (String) {

    var string: String
    switch scr {
    case 0.0..<60.0:
        string = "不及格"
        fallthrough
    case 60.0..<70.0:
        string = "及格"
    case 70.0..<80.0:
        string = "良好"
    case 80.0...100.0:
        string = "优先"
    default:
        string = "分数错误"
    }
    return string
}







