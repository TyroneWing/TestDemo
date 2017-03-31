//
//  BMHomeNewsView.h
//  StartAnimation
//
//  Created by ___liangdahong on 2016/11/22.
//  Copyright © 2016年 http://idhong.com/. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BMHomeNewsView : UIView

@property (nonatomic, copy) NSString *newsString;
@property (nonatomic, copy) dispatch_block_t tapBlock;

@end
