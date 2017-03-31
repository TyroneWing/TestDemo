//
//  IHLog.swift
//  CustomLog
//
//  Created by __liangdahong on 2016/11/1.
//  Copyright © 2016年 http://idhong.com/. All rights reserved.
//

import UIKit

func IHLog<T>(_ message: T ,
           file: String = (#file as NSString).lastPathComponent,
           funcName: String = #function, linNUm: Int = #line) -> () {
        print("\(file) [\(funcName)] \(linNUm) : \(message)")
}

extension Double {
    func bm_format(_ form: String) -> (String) {
        return String(format: form, self)
    }
}
