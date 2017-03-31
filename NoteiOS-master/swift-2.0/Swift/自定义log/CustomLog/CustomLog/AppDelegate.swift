//
//  AppDelegate.swift
//  CustomLog
//
//  Created by __liangdahong on 2016/11/1.
//  Copyright © 2016年 http://idhong.com/. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        IHLog("\(self)")
        return true
    }
}

