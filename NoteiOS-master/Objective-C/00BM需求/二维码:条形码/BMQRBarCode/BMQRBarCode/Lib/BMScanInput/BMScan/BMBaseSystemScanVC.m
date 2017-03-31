//
//  BMBaseSystemScanVC.m
//  BMQRBarCode
//
//  Created by ___liangdahong on 16/8/31.
//  Copyright © 2016年 elvin. All rights reserved.
//

#import "BMBaseSystemScanVC.h"
#import "BMScanSettingView.h"

@interface BMBaseSystemScanVC () <AVCaptureMetadataOutputObjectsDelegate>

@property (strong, nonatomic) AVCaptureSession           *session;
@property (strong, nonatomic) AVCaptureVideoPreviewLayer *previewLayer;
@property (nonatomic, strong) BMScanSettingView *scanSettingView;
@property (nonatomic, strong) UIImageView *qrLine;

@end

@implementation BMBaseSystemScanVC

#pragma mark -
#pragma mark - 生命周期

- (void)viewDidLoad {
    [super viewDidLoad];
    
    kPERMISSION;
    
    self.navigationController.navigationBar.hidden = NO;
    self.navigationController.navigationBar.translucent = NO;
    self.view.backgroundColor = [UIColor blackColor];
    
    [self creatScanning];
    [self.view addSubview:self.scanSettingView];
    [self.view addSubview:self.qrLine];
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

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self startScanning];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self closureScanning];
}

- (void)dealloc {
    [_session stopRunning];
    [_previewLayer removeFromSuperlayer];
}

#pragma mark - getters setters

- (void)setButtonTitle:(NSString *)buttonTitle {
    _buttonTitle = buttonTitle;
    [self.scanSettingView.clickbutton setTitle:buttonTitle forState:0];
}

- (void)setPromptTitle:(NSString *)promptTitle {
    _promptTitle = promptTitle;
    self.scanSettingView.promptTitleLabel.text = promptTitle;
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

- (AVCaptureVideoPreviewLayer *)previewLayer {
    if (!_previewLayer) {
        _previewLayer = [AVCaptureVideoPreviewLayer layerWithSession:_session];
        _previewLayer.videoGravity = AVLayerVideoGravityResize;
        // 必须添加
        _previewLayer.frame = [self screenBounds];
        _previewLayer.connection.videoOrientation = [self videoOrientationFromCurrentDeviceOrientation];
    }
    return _previewLayer;
}

#pragma mark - 系统delegate

- (void)captureOutput:(AVCaptureOutput *)captureOutput didOutputMetadataObjects:(NSArray *)metadataObjects fromConnection:(AVCaptureConnection *)connection {
    if (metadataObjects.count) {
        // 停止扫描
        [self closureScanning];
        AVMetadataMachineReadableCodeObject * metadataObject = [metadataObjects objectAtIndex:0];
        [self captureWithCodeString:metadataObject.stringValue];
    }
}

#pragma mark - 自定义delegate
#pragma mark - 公有方法

- (void)startScanning {

    [self.qrLine.layer removeAllAnimations];
    self.qrLine.hidden = NO;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.qrLine.layer addAnimation:[self getAnimation] forKey:@"translate"];
    });
    
    [self.view.layer insertSublayer:self.previewLayer atIndex:0];
    [_session startRunning];
}

- (void)closureScanning {
    [_session stopRunning];
    self.qrLine.hidden = YES;
    [self.previewLayer removeFromSuperlayer];
    self.previewLayer = nil;
    [self.qrLine.layer removeAllAnimations];
}

- (void)captureWithCodeString:(NSString *)codeString {
    
}

- (void)inputButtonClick {
    
}

#pragma mark - 私有方法

// 创建扫描
- (void)creatScanning {
    
    // 获取摄像设备
    AVCaptureDevice *device = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    
    // 创建输入流
    AVCaptureDeviceInput * input = [AVCaptureDeviceInput deviceInputWithDevice:device error:nil];
    
    // 创建输出流
    AVCaptureMetadataOutput * output = [[AVCaptureMetadataOutput alloc]init];
    
    // 设置代理 在主线程里刷新
    [output setMetadataObjectsDelegate:self queue:dispatch_get_main_queue()];

    // 初始化链接对象
    self.session = [[AVCaptureSession alloc] init];

    CGFloat y = kSCANSCANVIEWTOP;
    CGFloat x = (kSCANWIDTH-kSCANVIEWWIDTH)/2.0;
    [output setRectOfInterest:CGRectMake(y/kSCANHEIGHT,x/kSCANWIDTH,kSCANVIEWWIDTH/kSCANHEIGHT,kSCANVIEWWIDTH/kSCANWIDTH)];

    // 高质量采集率
    [_session setSessionPreset:AVCaptureSessionPresetHigh];
    
    [_session addInput:input];
    
    [_session addOutput:output];
    
    // 设置扫码支持的编码格式
    output.metadataObjectTypes = @[
                                   AVMetadataObjectTypeUPCECode,
                                   AVMetadataObjectTypeCode39Code,
                                   AVMetadataObjectTypeCode39Mod43Code,
                                   AVMetadataObjectTypeEAN13Code,
                                   AVMetadataObjectTypeEAN8Code,
                                   AVMetadataObjectTypeCode93Code ,
                                   AVMetadataObjectTypeCode128Code ,
                                   AVMetadataObjectTypePDF417Code,
                                   AVMetadataObjectTypeQRCode,
                                   AVMetadataObjectTypeAztecCode];

    [self.view.layer insertSublayer:self.previewLayer atIndex:0];
}

- (CGRect)screenBounds {
    
    UIScreen *screen = [UIScreen mainScreen];
    
    if (![screen respondsToSelector:@selector(fixedCoordinateSpace)]
        && UIInterfaceOrientationIsLandscape([UIApplication sharedApplication].statusBarOrientation)) {
        return CGRectMake(0, 0, CGRectGetHeight(screen.bounds), CGRectGetWidth(screen.bounds));
    }
    return screen.bounds;
}

- (AVCaptureVideoOrientation)videoOrientationFromCurrentDeviceOrientation {
    
    switch ([[UIApplication sharedApplication] statusBarOrientation]) {
        case UIInterfaceOrientationPortrait:
            return AVCaptureVideoOrientationPortrait;
            break;
        case UIInterfaceOrientationLandscapeLeft:
            return AVCaptureVideoOrientationLandscapeLeft;
            break;
        case UIInterfaceOrientationLandscapeRight:
            return AVCaptureVideoOrientationLandscapeRight;
            break;
        case UIInterfaceOrientationPortraitUpsideDown:
            return AVCaptureVideoOrientationPortraitUpsideDown;
            break;
        default:
            return AVCaptureVideoOrientationPortrait;
            break;
    }
}

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

@end
