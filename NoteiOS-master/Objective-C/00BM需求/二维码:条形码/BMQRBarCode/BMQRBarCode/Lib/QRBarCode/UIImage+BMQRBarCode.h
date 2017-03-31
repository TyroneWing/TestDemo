//
//  UIImage+BMQRBarCode.h
//  QRCode
//
//  Created by ___liangdahong on 16/8/30.
//  Copyright © 2016年 https://github.com/asiosldh/. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^BMReadQRCodeBlock)(NSString *qrString,NSError *error);

@interface UIImage (BMQRBarCode)

/*!
 *  @brief 生成条形码
 *
 *  @param barCode 条形码字符串
 *  @param maxSize 最大size
 *
 *  @return 生成的条形码
 */
+ (instancetype)bm_imageWithBarCode:(NSString *)barCode maxSize:(CGSize)maxSize;


/*!
 *  @brief 生成二维码
 *
 *  @param qrCode      二维码字符串
 *  @param centerImage 中间的小图标
 *  @param maxSize     最大size
 *
 *  @return 生成的二维码
 */
+ (instancetype)bm_imageWithQRCode:(NSString *)qrCode centerImage:(UIImage *)centerImage maxSize:(CGSize)maxSize;

/*!
 *  @brief 识别图片中的二维码
 *
 *  @param qrCodeImage 图片image
 *  @param codeBlock   block回调
 */
+ (void)bm_readQRCodeFromImage:(UIImage *)qrCodeImage codeBlock:(BMReadQRCodeBlock)codeBlock;
/*!
 *  @brief 识别图片中的二维码
 *
 *  @param qrCodeImageData 图片Data
 *  @param codeBlock       block回调
 */
+ (void)bm_readQRCodeFromImageData:(NSData *)qrCodeImageData codeBlock:(BMReadQRCodeBlock)codeBlock;

@end
