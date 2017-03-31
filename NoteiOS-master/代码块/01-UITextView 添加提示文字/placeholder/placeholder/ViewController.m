//
//  ViewController.m
//  placeholder
//
//  Created by ___liangdahong on 2017/3/7.
//  Copyright © 2017年 http://idhong.com/. All rights reserved.
//

#import "ViewController.h"
#import "UITextView+BMPlaceholder.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextView *textView;
@property (strong, nonatomic) UITextView *textView1; ///< <#Description#>
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    

    self.textView.bm_placeholder = @"请输入内容0...";

    [self.view addSubview:self.textView1];
    self.textView1.bm_placeholder = @"请输入内容1...";
}

- (UITextView *)textView1 {
    
    if (!_textView1) {
        _textView1 = [[UITextView alloc] initWithFrame:CGRectMake(0, 400, 100, 100)];
        _textView1.backgroundColor = [UIColor yellowColor];
    }
    return _textView1;
}

@end
