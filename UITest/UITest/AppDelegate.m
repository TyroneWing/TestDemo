//
//  AppDelegate.m
//  UITest
//
//  Created by yi on 17/4/14.
//  Copyright © 2017年 yi. All rights reserved.
//

#import "AppDelegate.h"
#import "OtherViewController.h"
#import "FirstViewController.h"
@interface AppDelegate ()<UITabBarControllerDelegate>

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    //创建一个带导航的根控制器
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:[[FirstViewController alloc] init]];
    UINavigationController *nav1 = [[UINavigationController alloc] initWithRootViewController:[[OtherViewController alloc] init]];
    
    UITabBarController *tabBarController = [[UITabBarController alloc] init];
    tabBarController.viewControllers = @[nav,nav1];
    
    nav.tabBarItem.title = @"消息";
    nav1.tabBarItem.title = @"发现";
    
    self.window.rootViewController = tabBarController;
    
    tabBarController.delegate = self;
    return YES;
    
    
    return YES;
}


//UITabBarController代理方法
- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController {
    
    static NSString *tabBarDidSelectedNotification = @"tabBarDidSelectedNotification";
    //当tabBar被点击时发出一个通知
    [[NSNotificationCenter defaultCenter] postNotificationName:tabBarDidSelectedNotification object:nil userInfo:nil];
    
    
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
