//
//  BMView.h
//  BMXib-01
//
//  Created by ___liangdahong on 2017/3/17.
//  Copyright © 2017年 ___liangdahong. All rights reserved.
//

#import <UIKit/UIKit.h>

IB_DESIGNABLE
@interface BMView : UIView

@property (weak, nonatomic) IBOutlet UISwitch *mySwitch;

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@property (nonatomic, readonly, strong) UIView *contentView;

@end
