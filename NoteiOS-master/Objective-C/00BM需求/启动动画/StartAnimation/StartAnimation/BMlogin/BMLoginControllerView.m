//
//  BMLoginControllerView.m
//  StartAnimation
//
//  Created by ___liangdahong on 2016/11/21.
//  Copyright © 2016年 http://idhong.com/. All rights reserved.
//

#import "BMLoginControllerView.h"

@interface BMLoginControllerView ()
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (nonatomic, copy) BMLoginActionBlock loginActionBlock;
@property (nonatomic, copy) dispatch_block_t forgetpasswordActionBlock;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *logeTopConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *logeBottConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *passwordTopConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *loginTopConstraint;

@end

@implementation BMLoginControllerView

- (void)awakeFromNib {
    [super awakeFromNib];
    CGFloat height = [[UIScreen mainScreen] bounds].size.height;
    self.logeTopConstraint.constant = height*0.07;
    NSLog(@"%@" ,@(height*0.07));
    self.logeBottConstraint.constant = height*0.07;
    self.passwordTopConstraint.constant = height*0.08;
    self.loginTopConstraint.constant = height*0.08;
}

+ (instancetype)loginControllerViewWithLoginActionBlock:(BMLoginActionBlock)loginActionBlock
                              forgetpasswordActionBlock:(dispatch_block_t)forgetpasswordActionBlock{
    BMLoginControllerView *loginControllerView = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil] firstObject];
    loginControllerView.autoresizingMask = UIViewAutoresizingNone;
    loginControllerView.loginActionBlock = loginActionBlock;
    loginControllerView.forgetpasswordActionBlock = forgetpasswordActionBlock;
    [loginControllerView.scrollView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:loginControllerView action:@selector(tapScrollViewClick)]];
    return loginControllerView;
}

- (IBAction)loginButtonClick {
    if (self.loginActionBlock) {
        self.loginActionBlock(self.userTextField.text, self.passwordTextField.text);
    }
}

- (IBAction)forgetpasswordButtonClick {
    if (self.forgetpasswordActionBlock) {
        self.forgetpasswordActionBlock();
    }
}

- (void)tapScrollViewClick {
    [self endEditing:YES];
}
@end
