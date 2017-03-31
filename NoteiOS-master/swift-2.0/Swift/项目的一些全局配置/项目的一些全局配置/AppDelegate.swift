//
//  AppDelegate.swift
//  项目的一些全局配置
//
//  Created by ___liangdahong on 2017/1/4.
//  Copyright © 2017年 http://idhong.com/. All rights reserved.
//
//
//UINavigationBar.appearance().barStyle = .Black
//UINavigationBar.appearance().setBackgroundImage(UIImage(), forBarPosition: UIBarPosition.Any, barMetrics: UIBarMetrics.Default)
//UINavigationBar.appearance().shadowImage = UIImage()
//UINavigationBar.appearance().tintColor = UIColor.whiteColor()
//UINavigationBar.appearance().barTintColor = defaultColor
//UINavigationBar.appearance().translucent = false
//UINavigationBar.appearance().clipsToBounds = false
//
//UINavigationBar.appearance().barStyle = .Black
//
//UINavigationBar.appearance().setBackgroundImage(UIImage(), forBarPosition: UIBarPosition.Any, barMetrics: UIBarMetrics.Default)
//



import UIKit

let kkey = "c";

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        UINavigationBar.appearance().barStyle = .black

        let appearance = UINavigationBar.appearance()
        appearance.barStyle = .black
        appearance.setBackgroundImage(UIImage.init(named: ""), for: .compactPrompt)
        appearance.shadowImage = UIImage()
        appearance.tintColor = UIColor.white
        appearance.barTintColor = UIColor.blue
        appearance.clipsToBounds = false
        
        for idex in ["c", 1, 1.0] as [Any] {
            print(idex)
            objc_setAssociatedObject(self, kkey, "a", .OBJC_ASSOCIATION_ASSIGN)
            objc_getAssociatedObject(self, kkey)
            
        }
        
        return true
    }


}

