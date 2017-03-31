//
//  DefineViewController.m
//  StudyProject
//
//  Created by Daredos on 16/4/26.
//  Copyright © 2016年 LiangDaHong. All rights reserved.
//

#import "DefineViewController.h"

// 1.宏定义与带参数的宏定义
#define K 0
#define KK(a)  ((a)*(a))

// 2.宏定义与取消宏定义
#define PI 3.14
#undef  PI   // 强制终止宏定义

// 3.条件编译

// 等价于：#ifdef COUNT,相反如果判断没有定义过则可以通过#if !defined(COUNT)或者#ifndef COUNT


// 如果定义了 宏 就else就
#ifdef COUNT
#else
#endif


// 如果定义了 宏 就
#ifdef COUNT
#endif

// 如果没定义了 宏 就
#ifndef ccc
#else
#endif

// 如果没定义了 宏 就
#ifndef ccc
#endif


#if !defined cc
#endif

#ifndef cc
#endif

// 如果没定义了 宏 就
#if !defined(COUNT)
#endif

//4.判断宏定义COUNT是否等于1
#if COUNT == 1  // 如果成立
#else
#endif

//5.判断宏定义COUNT是否等于1
#if 0  // 如果成立
#endif

//6.判断宏定义COUNT是否等于1
#ifndef kk // 如果没有定义宏就进入
#define kk
#endif

#define aaaa(c,d)  c##d


@interface DefineViewController ()
@property (weak, nonatomic) IBOutlet UIWebView *webView;

@end

@implementation DefineViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];

    NSString *path = [[NSBundle mainBundle] pathForResource:@"卡劵推送问题返回.rtf" ofType:nil];
    NSURL *url = [NSURL fileURLWithPath:path];
    [self.webView loadRequest:[NSURLRequest requestWithURL:url]];
    self.webView.scrollView.backgroundColor = [UIColor whiteColor];

    // 自动检测网页上的电话号码，单击可以拨打
    self.webView.dataDetectorTypes = UIDataDetectorTypePhoneNumber;
    
    self.webView.allowsInlineMediaPlayback = YES;
    
}
@end
