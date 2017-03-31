//
//  AppDelegate.swift
//  Swift-Category
//
//  Created by __liangdahong on 16/9/7.
//  Copyright © 2016年 https://github.com/asiosldh/. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        self.window?.backgroundColor = UIColor.whiteColor()
        self.window?.rootViewController = BMMainVC()
        return true
        
    }
}


