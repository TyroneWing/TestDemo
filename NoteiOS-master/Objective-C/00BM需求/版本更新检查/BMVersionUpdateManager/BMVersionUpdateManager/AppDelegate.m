//
//  AppDelegate.m
//  BMVersionUpdateManager
//
//  Created by ___liangdahong on 16/8/31.
//  Copyright © 2016年 https://github.com/asiosldh/. All rights reserved.
//

#import "AppDelegate.h"
#import "BMVersionUpdateManager.h"


@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    return YES;
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // 回到前台时 检测版本更新（内部自动处理相关UI）
    [[BMVersionUpdateManager sharedVersionUpdateManager] automaticCheckVersion];
}

@end
