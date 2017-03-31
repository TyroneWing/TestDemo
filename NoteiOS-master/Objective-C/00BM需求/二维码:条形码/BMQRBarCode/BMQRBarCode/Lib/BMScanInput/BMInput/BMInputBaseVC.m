//
//  BMInputBaseVC.m
//  BMQRBarCode
//
//  Created by ___liangdahong on 16/9/1.
//  Copyright © 2016年 elvin. All rights reserved.
//

#import "BMInputBaseVC.h"
#import "BMScanSettingView.h"
#import "BMScanInputSettingView.h"

@interface BMInputBaseVC ()

@property (nonatomic, strong) BMScanInputSettingView *scanInputSettingView;

@end

@implementation BMInputBaseVC

#pragma mark -
#pragma mark - 生命周期

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.scanInputSettingView];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    // 打开键盘自动适配 [IQKeyboardManager sharedManager].enable = YES;
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    // 关闭键盘自动适配 [IQKeyboardManager sharedManager].enable = NO;
}

#pragma mark - getters setters

- (UITextField *)inputTextField {
    return self.scanInputSettingView.inputTextField;
}
- (UIButton *)determineButton {
    return self.scanInputSettingView.determineButton;
}
- (UIButton *)scanfButton {
    return self.scanInputSettingView.scanfButton;
}
- (BMScanInputSettingView *)scanInputSettingView {
    if (!_scanInputSettingView) {
        __weak typeof(self) wself = self;
        _scanInputSettingView = [BMScanInputSettingView scanInputSettingViewWithFrame:CGRectMake(0, 0, kSCANWIDTH, kSCANHEIGHT-kSCANFNAVHEIGHT)
                                                                 determineActionBlock:^(NSString *scanneString) {
                                                                     __strong typeof(wself) self = wself;
                                                                     [self confirmButtonClickWithCodeString:scanneString];
                                                                 } scanfActionBlock:^{
                                                                     __strong typeof(wself) self = wself;
                                                                     [self scanCodeButtonClick];
                                                                 }];
    }
    return _scanInputSettingView;
}

#pragma mark - 系统delegate
#pragma mark - 自定义delegate
#pragma mark - 公有方法
- (void)confirmButtonClickWithCodeString:(NSString *)codeString {
}
- (void)scanCodeButtonClick {
}

#pragma mark - 私有方法
#pragma mark - 事件响应

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
}
@end
