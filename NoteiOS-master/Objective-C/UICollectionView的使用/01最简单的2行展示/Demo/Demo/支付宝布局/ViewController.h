//
//  ViewController.h
//  Demo
//
//  Created by ___liangdahong on 16/10/13.
//  Copyright © 2016年 http://idhong.com/. All rights reserved.
//

#import <UIKit/UIKit.h>
// Bit64颜色
#define kBit64Color(rgbValue)   [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0   \
green:((float)((rgbValue & 0xFF00) >> 8))/255.0       \
blue:((float)(rgbValue & 0xFF))/255.0                 \
alpha:1.0]

@interface ViewController : UIViewController


@end

