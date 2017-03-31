//
//  ViewController.m
//  scroll
//
//  Created by __liangdahong on 16/9/29.
//  Copyright © 2016年 http://idhong.com/. All rights reserved.
//

#import "ViewController.h"
#import "BMImageViewBrowseView.h"

@interface ViewController () <UIScrollViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    if (arc4random_uniform(2)) {
        [BMImageViewBrowseView showImageViewBrowseViewWithImage:[UIImage imageNamed:@"600.jpg"]];
    }else{
        [BMImageViewBrowseView showImageViewBrowseViewWithImageUrlString:@"http://1823.img.pp.sohu.com.cn/images/blog/2010/11/16/0/14/c39840516_12d06b9ca3cg214.jpg"];
    }
}
@end
