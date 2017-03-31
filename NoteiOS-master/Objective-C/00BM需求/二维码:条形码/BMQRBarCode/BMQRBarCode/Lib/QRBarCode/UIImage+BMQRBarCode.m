//
//  UIImage+BMQRBarCode.m
//  QRCode
//
//  Created by ___liangdahong on 16/8/30.
//  Copyright © 2016年 https://github.com/asiosldh/. All rights reserved.
//

#import "UIImage+BMQRBarCode.h"

@implementation UIImage (BMQRBarCode)

#pragma mark -

#pragma mark - 公有方法

+ (instancetype)bm_imageWithBarCode:(NSString *)barCode {
    
    if (!barCode || barCode.length == 0) return  nil;
    
    // 创建滤镜
    CIFilter *filter = [CIFilter filterWithName:@"CICode128BarcodeGenerator"];
    
    // 恢复滤镜的默认属性
    [filter setDefaults];
    
    // 将字符串转换成NSData
    NSData *data = [barCode dataUsingEncoding:NSUTF8StringEncoding];
    
    // 通过KVO设置滤镜inputMessage数据
    [filter setValue:data forKey:@"inputMessage"];
    
    // 获得滤镜输出的图像
    CIImage *outputImage = [filter outputImage];
    
    // 将CIImage转换成UIImage
    return [UIImage imageWithCIImage:outputImage];
}

+ (instancetype)bm_imageWithQRCode:(NSString *)qrCode {
    
    if (!qrCode || qrCode.length == 0) return nil;
    
    // str -> NSData
    NSData *strData = [qrCode dataUsingEncoding:NSUTF8StringEncoding allowLossyConversion:NO];
    
    //创建二维码滤镜
    CIFilter *qrFilter = [CIFilter filterWithName:@"CIQRCodeGenerator"];
    
    // KVO 设值
    [qrFilter setValue:strData forKey:@"inputMessage"];
    [qrFilter setValue:@"H" forKey:@"inputCorrectionLevel"];
    
    return [UIImage imageWithCIImage:qrFilter.outputImage];
}

+ (void)bm_readQRCodeFromImage:(UIImage *)qrCodeImage codeBlock:(void(^)(NSString *qrString,NSError *error))codeBlock {

    if (!codeBlock) return;

    UIImage * srcImage =  [UIImage imageWithData:UIImagePNGRepresentation(qrCodeImage)];
    if (!srcImage) {
        codeBlock(nil, [NSError errorWithDomain:@"未传入图片" code:0 userInfo:nil]);
        return;
    }
    CIContext *context = [CIContext contextWithOptions:nil];
    CIDetector *detector = [CIDetector detectorOfType:CIDetectorTypeQRCode context:context options:@{CIDetectorAccuracy:CIDetectorAccuracyHigh}];
    CIImage *image = [CIImage imageWithCGImage:srcImage.CGImage];
    NSArray *features = [detector featuresInImage:image];
    
    if (features.count == 0) {
        codeBlock(nil,[NSError errorWithDomain:@"未能识别出二维码" code:0 userInfo:nil]);
        return;
    }
    CIQRCodeFeature *feature = [features firstObject];
    NSString *result = feature.messageString;
    codeBlock(result,nil);
}

+ (void)bm_readQRCodeFromImageData:(NSData *)qrCodeImageData codeBlock:(BMReadQRCodeBlock)codeBlock {
    [self bm_readQRCodeFromImage:[UIImage imageWithData:qrCodeImageData] codeBlock:codeBlock];
}
#pragma mark - 私有方法

+ (UIImage *)createNonInterpolatedUIImageFormCIImage:(CIImage *)image maxSize:(CGSize)maxSize {

    // 取image的尺寸
    CGRect extent = CGRectIntegral(image.extent);

    if (CGRectGetWidth(extent) == 0 || CGRectGetHeight(extent) == 0)return nil;

    // 获取比例
    CGFloat scale = MIN(maxSize.width/CGRectGetWidth(extent), maxSize.height/CGRectGetHeight(extent));
    
    // 创建bitmap;
    size_t width = CGRectGetWidth(extent) * scale;
    size_t height = CGRectGetHeight(extent) * scale;
    CGColorSpaceRef cs = CGColorSpaceCreateDeviceGray();
    CGContextRef bitmapRef = CGBitmapContextCreate(nil, width, height, 8, 0, cs, (CGBitmapInfo)kCGImageAlphaNone);
    CIContext *context = [CIContext contextWithOptions:nil];
    CGImageRef bitmapImage = [context createCGImage:image fromRect:extent];
    CGContextSetInterpolationQuality(bitmapRef, kCGInterpolationNone);
    CGContextScaleCTM(bitmapRef, scale, scale);
    CGContextDrawImage(bitmapRef, extent, bitmapImage);
    // 保存bitmap到图片
    CGImageRef scaledImage = CGBitmapContextCreateImage(bitmapRef);
    CGContextRelease(bitmapRef);
    CGImageRelease(bitmapImage);
    return [UIImage imageWithCGImage:scaledImage];
}
@end
