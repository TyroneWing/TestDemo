//
//  AppDelegate.swift
//  CustomLog
//
//  Created by ___liangdahong on 16/9/1.
//  Copyright © 2016年 https://github.com/asiosldh/. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        DHLog(1)
        return true
    }
}

