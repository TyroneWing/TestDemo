//
//  main.swift
//  func
//
//  Created by ___liangdahong on 17/1/23.
//  Copyright © 2017年 蓝月亮（中国）有限公司. All rights reserved.
//

import Foundation

/*
 private        私有属性和方法，    仅在当前类中可以访问，不包括分类
 fileprivate    对文件的私有属性和方法 ，仅在当前文件中可以访问，包括同一个文件中不同的类
 public 表示当前类、属性或者方法只能在当前module内被继承或者override，在当前module意外只能被访问
 open 表示当前类、属性或者方法可以在任何地方被继承或者override；
 final 是一个辅助修饰词，表示当前类、属性或者方法在任何地方都只能被访问，不能被继承或者override；
 internal 表示默认级别。
 open、public、internal（默认）、fileprivate，private
 
 /*
 
 */
 
 */


// 定义函数时
// 1.带参数时

/*
 不带参数
 待参数
 不定义参数名称
 没有参数描述
 参数描述和名称一样
 参数描述和名称不一样
 有默认值
 扩展
 
 */

func func_test1() -> Void {
}

func func_test2(_: String) -> Void {
}

func func_test3(_ str: String) -> Void {
}

func func_test4(str: String) -> Void {
}

func func_test5(toStr str: String) -> Void {
}

func func_test6(toStr str: String = "") -> Void {
}

func func_test7(_ ii: inout Int, _: inout String) -> Void {
}

struct TimesTable {
    let multiplier: Int
    subscript(index: Int) -> Int {
        return multiplier * index
    }
}
let threeTimesTable = TimesTable.init(multiplier: 1)
print("six times three is \(threeTimesTable[6])")
// 打印 "six times three is 18"


class BMPerson: NSObject {
    var arr: Array = [Any]()
    subscript(index: Int) -> Int {
        return 1
    }
}
let per = BMPerson()
_ = per[1]


enum BMTYpe {
    case a
    subscript (index: Int) -> Int {
        set {
            print("set\(newValue)")
        }
        get {
            return 1
        }
    }
}
_ = BMTYpe.a[1]
var type1 = BMTYpe.a
type1[1] = 1

let i = Int()


enum BMType1 {
    case a
    subscript(key: String) -> Any {
        return ""
    }
    subscript(index: Int) -> Any {
        return ""
    }
}

let type2 = BMType1.a
_ = type2["key1"]
_ = type2[1]


























