//
//  ViewController.swift
//  02-懒加载
//
//  Created by __liangdahong on 16/8/31.
//  Copyright © 2016年 梁大红. All rights reserved.
//

import UIKit

let kwidth = UIScreen.mainScreen().bounds.size.width
let kheight = UIScreen.mainScreen().bounds.size.height

class ViewController: UIViewController {

    // 不可能为nil
    lazy var tableView1 = UITableView()
    

    lazy var array = {
        return ["1"]
    }()

    var name: String? {
        willSet {
            print("willSet\(newValue)")
        }
        didSet {
            print("didSet\(oldValue)")
        }
    }
    
    
    var age = {
        return 1
    }

    // 可能为nil
    lazy var tableView2: UITableView? = UITableView()

    // 不可能为nil
    lazy var tableView3: UITableView = {
        let tab = UITableView()
        tab.frame = CGRectMake(0, 0, kwidth, kheight)
        tab.delegate = self;
        tab.dataSource = self;
        return tab;
        let a = self.age;
    }()

    // 可能为nil
    lazy var tableView4: UITableView? = {
        let tab = UITableView()
        tab.frame = CGRectMake(0, 0, kwidth, kheight)
        tab.delegate = self;
        tab.dataSource = self;
        return tab;
    }()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView2 = nil;
        if let tab = self.tableView4 {
            self.view.addSubview(tab)
            self.array = ["1"];
        }
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let ID = "id"
        var cell = tableView.dequeueReusableCellWithIdentifier(ID) as UITableViewCell?
        if cell == nil {
            cell = UITableViewCell.init(style: .Default, reuseIdentifier: ID)
        }
        cell?.textLabel?.text = "\(indexPath.row)"
        self.name = "2";
        return cell!;
    }
}

