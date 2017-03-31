//
//  PropertyVC.swift
//  02-懒加载
//
//  Created by ___liangdahong on 16/9/5.
//  Copyright © 2016年 梁大红. All rights reserved.
//

import UIKit

class PropertyVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    // ----------------------------------------
    // lazy 加载
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.dataSource = self
        tableView.delegate = self
        return tableView
    }()
    // lazy 加载
    lazy var tableView1 = UITableView()
    // ----------------------------------------

    
    
    // ----------------------------------------
    // 1.存储属性（和oc的属性基本一样）
    var name: String?       // 可选择类型
    var name1: String = ""  // 不可选择类型

    
    // 2.计算属性 （和oc的只读属性差不多）
    var name2: String {

        if let name = self.name {
            return "&" + name1 + name
        }
        return "&" + name1
    }
    
    // 3.类属性
   static var classNmae: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tab = self.tableView
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
}
