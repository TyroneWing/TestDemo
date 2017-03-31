//
//  BMBaseZXingScanVC.m
//  BMQRBarCode
//
//  Created by ___liangdahong on 16/8/31.
//  Copyright © 2016年 elvin. All rights reserved.
//

#import "BMBaseZXingScanVC.h"
#import "BMScanSettingView.h"

@interface BMBaseZXingScanVC ()

@property (nonatomic, strong) BMScanSettingView *scanSettingView;
@property (nonatomic, strong) UIImageView *qrLine;
@property (nonatomic, strong) UIView *backColorView;

@end

@implementation BMBaseZXingScanVC

#pragma mark -
#pragma mark - 生命周期

- (instancetype)init {
    if (self = [super init]) {
        self.hidesBottomBarWhenPushed = YES;
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self startScanning];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self closureScanning];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.hidden = NO;
    self.navigationController.navigationBar.translucent = NO;
    self.view.backgroundColor = [UIColor blackColor];
    [self.view addSubview:self.backColorView];
    [self.view addSubview:self.scanSettingView];
    [self.view addSubview:self.qrLine];
}

#pragma mark - getters setters

- (UIView *)backColorView {
    if (!_backColorView) {
        _backColorView = [[UIView alloc] initWithFrame:self.view.bounds];
        _backColorView.backgroundColor = [UIColor blackColor];
        _backColorView.hidden = YES;
    }
    return _backColorView;
}

- (BMScanSettingView *)scanSettingView {
    if (!_scanSettingView) {
        __weak typeof(self) wself = self;
        _scanSettingView = [BMScanSettingView scanSettingViewWithInputButtonClickBlock:^{
            __strong typeof(wself) self = wself;
            [self inputButtonClick];
        }];
    }
    return _scanSettingView;
}

- (UIImageView *)qrLine {
    if (!_qrLine) {
        double x = (kSCANWIDTH-200)/2.0;
        double y = kSCANSCANVIEWTOP;
        _qrLine = [[UIImageView alloc] initWithFrame:CGRectMake(x, y, 200, 2)];
        _qrLine.image = [UIImage imageNamed:@"image_qr_scan_line_001"];
        _qrLine.contentMode = UIViewContentModeScaleAspectFill;
    }
    return _qrLine;
}
- (void)setButtonTitle:(NSString *)buttonTitle {
    _buttonTitle = buttonTitle;
    [self.scanSettingView.clickbutton setTitle:buttonTitle forState:0];
}

- (void)setPromptTitle:(NSString *)promptTitle {
    _promptTitle = promptTitle;
    self.scanSettingView.promptTitleLabel.text = promptTitle;
}

#pragma mark - 系统delegate
#pragma mark - 自定义delegate

- (void)scanResultWithArray:(NSArray<LBXScanResult*>*)array {
    if (array.count == 0) {
        return;
    }
    LBXScanResult *model = array[0];
    [self closureScanning];
    [self captureWithCodeString:model.strScanned];
}

#pragma mark - 公有方法
#pragma mark - 私有方法
- (CABasicAnimation *)getAnimation {

    // 说明这个动画对象要对CALayer的position属性执行动画
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"position"];
    // 动画持续1.5s
    animation.duration = 1.3333f;
    double x = (kSCANWIDTH-200)/2.0;
    double y = kSCANSCANVIEWTOP;
    // position属性值从(50, 80)渐变到(300, 350)
    
    animation.fromValue = [NSValue valueWithCGPoint:CGPointMake(x+kSCANVIEWWIDTH/2.0, y+1)];
    animation.toValue = [NSValue valueWithCGPoint:CGPointMake(x+kSCANVIEWWIDTH/2.0, y+1+kSCANVIEWWIDTH)];

    // 设置动画的代理
    animation.delegate = self;
    
    animation.repeatCount = INT_MAX;
    
    // 保持动画执行后的状态
    animation.removedOnCompletion = NO;
    
    animation.autoreverses = YES;
    
    animation.fillMode = kCAFillModeForwards;
    
    return animation;
}
#pragma mark - 事件响应
- (void)startScanning {
    [self.qrLine.layer removeAllAnimations];
    self.qrLine.hidden = NO;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.qrLine.layer addAnimation:[self getAnimation] forKey:@"translate"];
    });
    [self.scanObj startScan];
    self.backColorView.hidden = YES;
}

- (void)closureScanning {
    self.qrLine.hidden = YES;
    self.backColorView.hidden = NO;
    [self.qrLine.layer removeAllAnimations];
    [self.scanObj stopScan];
}

- (void)captureWithCodeString:(NSString *)codeString {}
- (void)inputButtonClick {}
@end

