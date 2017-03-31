//
//  ViewController.m
//  BMVersionUpdateManager
//
//  Created by ___liangdahong on 16/8/31.
//  Copyright © 2016年 https://github.com/asiosldh/. All rights reserved.
//

#import "ViewController.h"
#import "BMVersionUpdateManager.h"

@interface ViewController ()

@end

@implementation ViewController

- (IBAction)versionUpdateClick:(id)sender {

    [[BMVersionUpdateManager sharedVersionUpdateManager] checkVersionUpdate:^(BOOL isNeedUpdate, NSString *version, NSString *buildVersion, BOOL isForceUpdate, NSString *download, NSString *description) {
        NSLog(@"");
    } failure:^(NSError *error) {
    }];
    
}
@end
