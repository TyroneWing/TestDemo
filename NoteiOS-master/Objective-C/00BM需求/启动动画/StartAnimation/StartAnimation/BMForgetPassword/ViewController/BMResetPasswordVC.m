//
//  BMResetPasswordVC.m
//  StartAnimation
//
//  Created by ___liangdahong on 2016/11/21.
//  Copyright © 2016年 http://idhong.com/. All rights reserved.
//

#import "BMResetPasswordVC.h"

@interface BMResetPasswordVC ()

@property (weak, nonatomic) IBOutlet UIImageView *viewBackgroundImageView;
@property (weak, nonatomic) IBOutlet UIImageView *scrollBackgroundImageView;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UITextField *userTextField;
@property (weak, nonatomic) IBOutlet UITextField *phoneTextField;
@property (weak, nonatomic) IBOutlet UITextField *verificationCodeTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;
@property (weak, nonatomic) IBOutlet UITextField *confirmPasswordTextField;
@property (weak, nonatomic) IBOutlet UIButton *getVerificationCodeButton;
@property (weak, nonatomic) IBOutlet UIButton *submitButton;
@end

@implementation BMResetPasswordVC
#pragma mark -

#pragma mark - 生命周期

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUI];
}

#pragma mark - getters setters

#pragma mark - 系统delegate

#pragma mark - UITableViewDelegate UITableViewDataSource

#pragma mark - 自定义delegate

#pragma mark - 公有方法

#pragma mark - 私有方法

- (void)setUI {
    self.viewBackgroundImageView.userInteractionEnabled = YES;
    self.scrollBackgroundImageView.userInteractionEnabled = YES;
    self.getVerificationCodeButton.layer.cornerRadius = 2;
    self.getVerificationCodeButton.clipsToBounds = YES;
    self.submitButton.layer.cornerRadius = 2;
    self.submitButton.clipsToBounds = YES;
    self.userTextField.clearButtonMode    = UITextFieldViewModeAlways;
    _passwordTextField.clearButtonMode = UITextFieldViewModeAlways;
    _passwordTextField.secureTextEntry = YES;
}

#pragma mark - 事件响应

- (IBAction)backButtonClick {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)tapScrollViewClick {
    [self.view endEditing:YES];
}
@end
