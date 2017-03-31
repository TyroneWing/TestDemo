//
//  UIViewController+Swizzle.swift
//  swift-initialize
//
//  Created by ___liangdahong on 16/9/9.
//  Copyright © 2016年 https://github.com/asiosldh/. All rights reserved.
//

import UIKit

// http://nshipster.cn/swift-objc-runtime/

extension UIViewController {

    public override class func initialize() {

        struct Static {
            static var token: dispatch_once_t = 0
        }

        if self !== UIViewController.self {
            return
        }

        dispatch_once(&Static.token) {
            
            let originalSelector = #selector(UIViewController.viewWillAppear(_:))
            
            let swizzledSelector = #selector(UIViewController.nsh_viewWillAppear(_:))

            let originalMethod = class_getInstanceMethod(self, originalSelector)
            let swizzledMethod = class_getInstanceMethod(self, swizzledSelector)
            
            let didAddMethod = class_addMethod(self, originalSelector, method_getImplementation(swizzledMethod), method_getTypeEncoding(swizzledMethod))
            if didAddMethod {
                class_replaceMethod(self, swizzledSelector, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod))
            } else {
                method_exchangeImplementations(originalMethod, swizzledMethod);
            }
        }
    }

    func nsh_viewWillAppear(animated: Bool) {
        self.nsh_viewWillAppear(animated)
    }
}