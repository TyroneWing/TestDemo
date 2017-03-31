//
//  Func 函数.swift
//  01-swift基础语法
//
//  Created by __liangdahong on 16/8/30.
//  Copyright © 2016年 https://github.com/asiosldh/. All rights reserved.
//

import Foundation

// FUNC 1
func swiftFunc() -> () {
}

// 没有参数 没有返回值
func fun1() -> Void{
}

// 有参数 没有返回
func fun2WithA(a a:Int, b: Int, c: Bool) {
}

// 没有参数 有返回
func fun4WithA() -> (Double){
    return 0.0;
}

// 有参数 有返回
func fun3(a a:Int, b: Int, c: Bool) -> (Double){
    return 1.0;
}

func fun5() -> (a: Int, b: Int) {
    return (1,2)
}


func fun6(a:(c: Int, d: Int)) -> (a: Int, b: Int) {
    return (1,2)
}

func fun6(f:() -> ()) -> Void {
    f();
}

// 使用的注意点
func sub(num1 num1: Int, num2: Int) -> (Int) {
    return num1 + num2;
    sub(num1: 0, num2: 0)
}

// 一句代码搞定2 个方法
func makeCof(name name: String) -> Void {
    return;
    makeCof(name: "")
}

func makeCoff(name name: String = "def") -> Void {
    return;
    makeCoff()
    makeCoff(name: "")
}

func makeCOff1(name name: String = "", age: Int, id: Int = 0) -> () {
    return;
    makeCOff1(age: 1);
    makeCOff1(name: "1", age: 10);
    makeCOff1(name: "1", age: 0, id: 1);
    makeCOff1( age: 1, id: 1);
}

func subs(nums nums: Int...) -> (Int) {
    var n = 0
    for num in nums {
        n+=num
    }
    return n
    subs(nums: 1,2)
}

// 指针类型
func swap( inout num1 num1: Int, inout num2: Int) -> () {
    return
}

func fun8() -> () {
    func test() -> (){}
    test();
}
