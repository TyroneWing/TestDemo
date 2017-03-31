//
//  ViewController.swift
//  04-递归枚举
//
//  Created by ___liangdahong on 16/9/8.
//  Copyright © 2016年 https://github.com/asiosldh/. All rights reserved.
//

import UIKit

// http://wiki.jikexueyuan.com/project/swift/chapter2/08_Enumerations.html#raw_values

// 暂未具体使用  感觉好麻烦

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}


//class MyManager {
//    class var sharedManager : MyManager {
//
//        struct Static {
//            static var onceToken : dispatch_once_t = 0
//            static var staticInstance : MyManager? = nil
//        }
//        Static();
//        
//        dispatch_once(&Static.onceToken) {
//            Static.staticInstance = MyManager()
//        }
//        return Static.staticInstance!
//    }
//}


//class MyManager {
//    class var sharedManager : MyManager {
//        struct Static {
//            static let sharedInstance  = MyManager()
//        }
//        return Static.sharedInstance
//    }
//}

class MyManager {
    static let sharedInstance = MyManager()
    fileprivate init() {
    }
}













