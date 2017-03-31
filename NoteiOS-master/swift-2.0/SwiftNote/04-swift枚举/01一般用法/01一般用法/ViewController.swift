//
//  ViewController.swift
//  01一般用法
//
//  Created by ___liangdahong on 16/9/8.
//  Copyright © 2016年 https://github.com/asiosldh/. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    // 可nil
    var person: BMPerson!
    // 不可nil
    var person1 = BMPerson()

    var person2: BMPerson = {
        let per = BMPerson()
        per.grade = Grade.Advanced
        per.sex = Sex.Man
        return per
    }()

    lazy var person3: BMPerson = {
        let per = BMPerson()
        return per
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.person = nil
        self.person1 = BMPerson()
        self.person2 = BMPerson()
    }
}

