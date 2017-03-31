//
//  MYSelfDataVC.m
//  File
//
//  Created by ___liangdahong on 2016/11/28.
//  Copyright © 2016年 http://idhong.com/. All rights reserved.
//

#import "MYSelfDataVC.h"

@interface MYSelfDataVC ()
@property (weak, nonatomic) IBOutlet UIWebView *webView;

@end

@implementation MYSelfDataVC

- (void)viewDidLoad {
    [super viewDidLoad];
    NSURL *url = [NSURL fileURLWithPath:self.path];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [self.webView loadRequest:request];
}

@end
