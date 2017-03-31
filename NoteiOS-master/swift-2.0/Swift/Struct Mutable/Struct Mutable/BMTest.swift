//
//  BMTest.swift
//  Struct Mutable
//
//  Created by ___liangdahong on 16/10/20.
//  Copyright © 2016年 http://idhong.com/. All rights reserved.
//

import Foundation


protocol BMProtocol1 {
    var number : Int{get set}
    func changeColor()
}

class BMPerson1: NSObject {

    func swapMe<T>(inout a: T, inout b: T) -> () {
        let temp = a
        a = b
        b = temp
    }
    func swapMe1<T>(inout a: T, inout b: T) -> () {
        (a,b) = (b,a);
    }
    func test2() -> (a: Int, b: Double) {
        var (a, b) = (1, 200)
        a = 22;
        b = 99;
        return (1,1.0)
    }
}


