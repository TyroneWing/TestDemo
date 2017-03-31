//
//  TestVC.m
//  Signature
//
//  Created by ___liangdahong on 16/8/31.
//  Copyright © 2016年 https://github.com/asiosldh/. All rights reserved.
//

#import "TestVC.h"
#import "PJRSignatureView.h"

@interface TestVC ()

@property (weak, nonatomic) IBOutlet PJRSignatureView *sig;

@end

@implementation TestVC

- (void)viewDidLoad {
    [super viewDidLoad];

    UIButton *button = [UIButton buttonWithType:UIButtonTypeContactAdd];
    button.frame = CGRectMake(100, 100, 20, 20);
    self.sig.promptView = button;
}



@end
