//
//
//
//
//  Created by ___liangdahong on 2016/11/24.
//  Copyright © 2016年 蓝月亮. All rights reserved.
//

#import "UIImage+BMTensile.h"

@implementation UIImage (BMTensile)

+ (instancetype)bm_imageWithName:(NSString *)name {
    
    return [self bm_imageWithImage:[UIImage imageNamed:name]];
}

+ (instancetype)bm_imageWithName:(NSString *)name point:(CGPoint)point {

    return [self bm_imageWithImage:[UIImage imageNamed:name] point:point];
}

+ (instancetype)bm_imageWithImage:(UIImage *)image {
    
    return [self bm_imageWithImage:image point:CGPointMake(image.size.width * 0.5f, image.size.height * 0.5f)];
}

+ (instancetype)bm_imageWithImage:(UIImage *)image point:(CGPoint)point {
    
    if (!image || image.size.width == 0 || image.size.height == 0) {
        return nil;
    }
    if (point.x > image.size.width || point.y > image.size.height) {
        return nil;
    }
    // 设置端盖的值
    CGFloat top    = point.y;
    CGFloat left   = point.x;
    CGFloat bottom = image.size.height - point.y;
    CGFloat right  = image.size.width  - point.x;
    UIEdgeInsets edgeInsets = UIEdgeInsetsMake(top, left, bottom, right);
    return [image resizableImageWithCapInsets:edgeInsets];
    
}
@end
