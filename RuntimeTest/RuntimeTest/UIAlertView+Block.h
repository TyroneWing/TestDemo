//
//  UIAlertView+Block.h
//  RuntimeTest
//
//  Created by __liangdahong on 2017/4/14.
//  Copyright © 2017年 yi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIAlertView (Block)
@property (copy, nonatomic) void (^block)(UIAlertView *UIAlertView, NSInteger buttonIndex);
- (void)showUsingBlock:(void (^)(UIAlertView *, NSInteger))block;
@end
