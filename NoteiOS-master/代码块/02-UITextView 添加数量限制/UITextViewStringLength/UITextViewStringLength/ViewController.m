//
//  ViewController.m
//  UITextViewStringLength
//
//  Created by ___liangdahong on 2017/3/7.
//  Copyright © 2017年 http://idhong.com/. All rights reserved.
//

#import "ViewController.h"
#import "UITextView+BMInputLengthLimit.h"

@interface ViewController () <UITextViewDelegate>

@property (strong, nonatomic) UITextView *text;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.text = [[UITextView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    self.text.backgroundColor = [UIColor redColor];
    [self.view addSubview:self.text];
//    self.text.delegate = self;
    self.text.bm_maxLimitNumber = 5;
    
    if ([self respondsToSelector:@selector(textView:shouldChangeTextInRange:replacementText:)]) {
        NSLog(@"you");

    } else {
        NSLog(@"no");
    }
    
    self.text.bm_contentSuperLimitBlock = ^(UITextView *textView, NSRange range, NSString *string ){

        NSLog(@"bm_contentSuperLimitBlock");
    };
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    NSInteger max = arc4random_uniform(10);
    NSLog(@"%ld", NSIntegerMax);
    self.text.bm_maxLimitNumber = max;
    
    
}

@end

