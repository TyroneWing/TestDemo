//
//  BMScanSettingView.h
//  BMQRBarCode
//
//  Created by ___liangdahong on 16/8/31.
//  Copyright © 2016年 elvin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

#define kSCANWIDTH       [UIScreen mainScreen].bounds.size.width
#define kSCANHEIGHT      [UIScreen mainScreen].bounds.size.height
#define kSCANFNAVHEIGHT  64.0f
#define kSCANVIEWWIDTH   200.0f

// 为不同的设备做不同的UI
#define kSCANSCANVIEWTOP kSCANHEIGHT < 500 ? 30 : (kSCANHEIGHT-kSCANFNAVHEIGHT-kSCANVIEWWIDTH)/2.0f

#define kPERMISSION      \
    if (![UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {\
        return ;\
    }\
    AVAuthorizationStatus authStatus = [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeVideo];\
    if (authStatus == AVAuthorizationStatusRestricted || authStatus == AVAuthorizationStatusDenied) {\
        return ;\
    }\

/*!
 *  @brief 扫描界面配置view （外部不需使用）
 */
@interface BMScanSettingView : UIView

@property (weak, nonatomic) IBOutlet UILabel *promptTitleLabel;
@property (weak, nonatomic) IBOutlet UIButton *clickbutton;

+ (instancetype)scanSettingViewWithInputButtonClickBlock:(dispatch_block_t)block;
@end
