//
//  MyScanfVC.m
//  BMQRBarCode
//
//  Created by ___liangdahong on 16/8/31.
//  Copyright © 2016年 elvin. All rights reserved.
//

#import "MyScanfVC.h"

@interface MyScanfVC ()

@end

@implementation MyScanfVC

- (void)viewDidLoad {
    [super viewDidLoad];
}

// 扫描到数据
- (void)captureWithCodeString:(NSString *)codeString {
    [super captureWithCodeString:codeString];
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:codeString message:nil preferredStyle:UIAlertControllerStyleAlert];
    [alert addAction:[UIAlertAction actionWithTitle:@"好的" style:0 handler:^(UIAlertAction * _Nonnull action) {
        ;
    }]];
    [self presentViewController:alert animated:YES completion:nil];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self startScanning];
        
    });
}

// 按钮点击
- (void)inputButtonClick {
    
    [super inputButtonClick];
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"nputButton 点击了" message:nil preferredStyle:UIAlertControllerStyleAlert];
    [alert addAction:[UIAlertAction actionWithTitle:@"好的" style:0 handler:^(UIAlertAction * _Nonnull action) {
        ;
    }]];
    [self presentViewController:alert animated:YES completion:nil];
}
@end
