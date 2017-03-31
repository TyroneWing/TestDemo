//
//  AppDelegate.m
//  StartAnimation
//
//  Created by ___liangdahong on 2016/11/18.
//  Copyright © 2016年 http://idhong.com/. All rights reserved.
//

#import "AppDelegate.h"
#import "BMStartAnimationVC.h"
#import "BMHomeDrawerVC.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    [self.window makeKeyAndVisible];
    self.window.backgroundColor = [UIColor whiteColor];
    self.window.rootViewController = 1 ? [BMStartAnimationVC new] : [BMHomeDrawerVC homeDrawerControllerWithAnimations:YES];
    return YES;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.window endEditing:YES];
}
@end
