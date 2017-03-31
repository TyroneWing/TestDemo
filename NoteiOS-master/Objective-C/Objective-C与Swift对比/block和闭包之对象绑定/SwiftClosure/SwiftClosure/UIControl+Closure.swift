//
//  UIControl+Closure.swift
//  SwiftClosure
//
//  Created by ___liangdahong on 16/9/9.
//  Copyright © 2016年 https://github.com/asiosldh/. All rights reserved.
//

import UIKit

// 参考
// http://stackoverflow.com/questions/29106891/how-do-i-pass-in-a-void-block-to-objc-setassociatedobject-in-swift
// http://www.hmttommy.com/2015/12/11/AddCategoryProperty/
// http://nshipster.cn/swift-objc-runtime/

typealias IHClosure = @convention(block)() -> ()

extension UIControl {

    private struct ClosureKey {
        static var touchUpInsideKey = "touchUpInsideKey"
    }
    
    func ih_addTouchUpInsideClosure(closure: IHClosure) {
        let obj: AnyObject = unsafeBitCast(closure, AnyObject.self)
        objc_setAssociatedObject(self, &ClosureKey.touchUpInsideKey, obj, .OBJC_ASSOCIATION_COPY_NONATOMIC)
        
        self.addTarget(self, action: #selector(UIControl._touchUpInside), forControlEvents: .TouchUpInside)
    }

    @objc private func _touchUpInside() {
        let obj: AnyObject = objc_getAssociatedObject(self, &ClosureKey.touchUpInsideKey)
        let closure: IHClosure = unsafeBitCast(obj, IHClosure.self)
        closure()
    }
}
