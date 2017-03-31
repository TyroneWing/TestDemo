//
//  BMDefinition.swift
//  swift 中log 的使用
//
//  Created by __liangdahong on 16/8/31.
//  Copyright © 2016年 梁大红. All rights reserved.
//

import Foundation

func DHLog1<T>(message: T ,file: String = (#file as NSString).lastPathComponent,
            funcName: String = #function, linNUm: Int = #line) -> () {
    print("\(file) [\(funcName)] \(linNUm) : \(message)")
}

private let kprint = true
func DHLog2<T>(message: T ,file: String = (#file as NSString).lastPathComponent,
           funcName: String = #function, linNUm: Int = #line) -> () {
    if kprint {
        print("\(file) [\(funcName)] \(linNUm) : \(message)")
    }
}

private let kDebug = _isDebugAssertConfiguration()
func DHLog<T>(message: T ,file: String = (#file as NSString).lastPathComponent,
            funcName: String = #function, linNUm: Int = #line) -> () {
    if kDebug {
        print("\(file) [\(funcName)] \(linNUm) : \(message)")
    }
}

