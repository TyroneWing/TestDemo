
//
//  BMVersionUpdateManager.m
//  BMBlueMoonAngel
//
//  Created by ___liangdahong on 16/8/22.
//  Copyright © 2016年 elvin. All rights reserved.
//

#import "BMVersionUpdateManager.h"
#import <UIKit/UIKit.h>

#define kBMUserDefaultVersionUpdateManagerKey @"kBMUserDefaultVersionUpdateManagerKey"
#define kBMVersionUpdateManagerKey            @"kBMVersionUpdateManagerKey"
#define kBMVersionUpdateManagerTimeKey        7200

static BMVersionUpdateManager *manager = nil;

@implementation BMVersionUpdateManager

+ (instancetype)sharedVersionUpdateManager {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[self alloc] init];
    });
    return manager;
}

- (void)automaticCheckVersion {
    
    [self checkVersionUpdate:^(BOOL isNeedUpdate, NSString *version, NSString *buildVersion, BOOL isForceUpdate, NSString *download, NSString *description) {
        if (!isNeedUpdate) {
            NSLog(@"没有新版本 直接返回");
            return;
        }
        // 有新版本而且是强制更新直接弹强制更新弹窗
        if (isForceUpdate) {
            NSLog(@"强制更新");
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"强制更新" message:nil delegate:nil cancelButtonTitle:nil otherButtonTitles:@"更新", nil];
            [alert show];
            return;
        }
        NSDate *lastDate = [[[NSUserDefaults standardUserDefaults] dictionaryForKey:kBMUserDefaultVersionUpdateManagerKey] objectForKey:kBMVersionUpdateManagerKey];
        NSLog(@"lastDate = %@",lastDate);

        NSDate *currDate = [NSDate date];
        NSLog(@"currDate = %@",currDate);
        
        // 如果没有保存时间或者时间段超过2小时就弹窗
        if (!lastDate || (currDate.timeIntervalSince1970 - lastDate.timeIntervalSince1970) > kBMVersionUpdateManagerTimeKey) {
            NSLog(@"需要提示新版本 （不强制更新）");
            NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
            NSMutableDictionary *mDic = [NSMutableDictionary dictionaryWithDictionary:[ud dictionaryForKey:kBMUserDefaultVersionUpdateManagerKey]];
            mDic[kBMVersionUpdateManagerKey] = currDate;
            [ud setObject:mDic forKey:kBMUserDefaultVersionUpdateManagerKey];
            [ud synchronize];
            
            // 有新版本弹窗提示
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"新版本提示" message:nil delegate:nil cancelButtonTitle:@"暂不更新" otherButtonTitles:@"更新", nil];
            [alert show];
            return;
        }
        NSLog(@"有新版本 但是时间段没有2小时");
    } failure:nil];
}

- (void)checkVersionUpdate:(BMVersionUpdateSuccess)success failure:(BMVersionUpdateFailure)failure {

    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        if (success) {
            success(YES, @"2.0", @"100", arc4random_uniform(2), @"1", @"1");
        }
    });
}

@end
