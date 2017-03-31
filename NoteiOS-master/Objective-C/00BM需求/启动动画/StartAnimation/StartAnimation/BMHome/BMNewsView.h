//
//  BMNewsView.h
//  StartAnimation
//
//  Created by ___liangdahong on 2016/11/22.
//  Copyright © 2016年 http://idhong.com/. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BMNewsView : UIView
@property (weak, nonatomic) IBOutlet UILabel *newsLabel1;
@property (weak, nonatomic) IBOutlet UILabel *newsLabel2;
@property (weak, nonatomic) IBOutlet UILabel *newsLabel3;
@property (weak, nonatomic) IBOutlet UIView *backgroundView;

+ (instancetype)newsViewWithTapActionBlock:(dispatch_block_t)block;

@end
