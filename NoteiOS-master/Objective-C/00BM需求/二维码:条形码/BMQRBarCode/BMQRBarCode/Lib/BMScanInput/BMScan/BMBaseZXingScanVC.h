//
//  BMBaseZXingScanVC.h
//  BMQRBarCode
//
//  Created by ___liangdahong on 16/8/31.
//  Copyright © 2016年 elvin. All rights reserved.
//

#import "LBXScanViewController.h"

/*!
 *  @brief 洗衣服务二期 基于ZXing的baseVC (可以识别 codeBar类型的条形码 系统无法识别）
 *  如果不是非常特殊要求建议不使用此类，因为效率比较低下
 *  使用时继承于此控制器即可
 */
@interface BMBaseZXingScanVC : LBXScanViewController

/*!
 *  @brief 提示文字 （默认：请吧二维码/条形码...）
 */
@property (nonatomic, copy) NSString *promptTitle;

/*!
 *  @brief 输入按钮上的文字
 */
@property (nonatomic, copy) NSString *buttonTitle;

/*!
 *  @brief 开始扫描 如果重写需 调[super startScanning]
 */
- (void)startScanning;

/*!
 *  @brief 结束扫描 如果重写需 调[super closureScanning]
 */
- (void)closureScanning;

/*!
 *  @brief 扫描到数据时 回调
 *
 *  @param codeString 扫描到的内容 (扫描到内容时间 自动会停止扫描，如果想继续开启需要调有开始扫描方法)
 */
- (void)captureWithCodeString:(NSString *)codeString;

/*!
 *  @brief 输入验证码按钮点击 回调
 */
- (void)inputButtonClick;
@end
