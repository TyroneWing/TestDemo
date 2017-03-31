//
//  IOSNotebookViewController.m
//  StudyProject
//
//  Created by Daredos on 16/4/26.
//  Copyright © 2016年 LiangDaHong. All rights reserved.
//

#import "IOSNotebookViewController.h"
#import "Masonry.h"

@interface IOSNotebookViewController ()

@property (strong, nonatomic) UIWebView *webView;

@end
@implementation IOSNotebookViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.webView];
    [self.webView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(UIEdgeInsetsMake(0, 0, 0, 0));
    }];
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"IOSNotebook.rtf" ofType:nil];
    NSURL *url = [NSURL fileURLWithPath:path];
    [self.webView loadRequest:[NSURLRequest requestWithURL:url]];
    self.webView.scrollView.backgroundColor = [UIColor whiteColor];
    
    // 自动检测网页上的电话号码，单击可以拨打
    self.webView.dataDetectorTypes = UIDataDetectorTypeAll;
}

- (UIWebView *)webView {
    
    if (!_webView) {
        _webView = [[UIWebView alloc] init];;
    }
    return _webView;
}

@end
