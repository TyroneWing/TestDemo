//
//  main.swift
//  Struct Mutable
//
//  Created by ___liangdahong on 16/10/20.
//  Copyright © 2016年 http://idhong.com/. All rights reserved.
//

import Foundation

struct User {
    var age: Int
    var weight : Int
    var height : Int
    
    mutating func addWeight(nsewWeight: Int) -> () {
        weight += nsewWeight
    }
}

var user: User = User(age: 1, weight: 100, height: 170)
print(user)
user.addWeight(1);
print(user)



class BMUser: NSObject {
    var age = 0
    var weight = 0
    var height = 0

    func addHeight(addHeight: Int!) -> (){
        self.age = self.age + addHeight;
    }
}
var use = BMUser();
print("\(use.age)")
use.addHeight(1);
print("\(use.age)")



