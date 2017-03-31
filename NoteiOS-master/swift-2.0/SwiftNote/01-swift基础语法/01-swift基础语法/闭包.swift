//
//  闭包.swift
//  01-swift基础语法
//
//  Created by __liangdahong on 16/8/30.
//  Copyright © 2016年 https://github.com/asiosldh/. All rights reserved.
//

import Foundation

class BMPerson2: NSObject {
    
    var name = ""
    
    func getData(block: ((data: String) -> ())? ) -> () {
        self.name = "a"
        block?(data: "");
    }

    // 麻烦
    func test1() {
        weak var wself = self;
        self.getData {(data) in
            wself?.name = "1";
        }
    }
    
    // 不安全
    func test2() {
        self.getData { [unowned self](data) in
            self.name = "1";
        }
    }
    
    // 推荐
    func test3() {
        self.getData { [weak self](data) in
            self?.name = "1";
        }
    }
    // func 尾部的参数是一个闭包时可以简化写
}

func test11() -> () {
    let p = BMPerson2()
    p.getData { (data) in
    }
}