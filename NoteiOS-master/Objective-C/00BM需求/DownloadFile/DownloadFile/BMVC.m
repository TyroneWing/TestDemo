//
//  BMVC.m
//  DownloadFile
//
//  Created by __liangdahong on 2016/12/4.
//  Copyright © 2016年 http://idhong.com/. All rights reserved.
//

#import "BMVC.h"

@interface BMVC ()
@property (weak, nonatomic) IBOutlet UIWebView *webView;


@end

@implementation BMVC

- (void)viewDidLoad {
    [super viewDidLoad];

    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL fileURLWithPath:self.filePath isDirectory:YES]];
    [self.webView loadRequest:request];
}

@end
