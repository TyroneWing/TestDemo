//
//  BMScanInputSettingView.h
//  BMQRBarCode
//
//  Created by ___liangdahong on 16/9/1.
//  Copyright © 2016年 elvin. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^DetermineActionBlock)(NSString *scanneString);

/*!
 *  @brief 洗衣服务二期 输入验证码界面 base 配置view
 */
@interface BMScanInputSettingView : UIView
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *inputTestFieldTopLayoutCons;
@property (copy, nonatomic)  DetermineActionBlock determineActionBlock;
@property (nonatomic, copy) dispatch_block_t scanfActionBlock;

@property (weak, nonatomic) IBOutlet UITextField *inputTextField;
@property (weak, nonatomic) IBOutlet UIButton *determineButton;
@property (weak, nonatomic) IBOutlet UIButton *scanfButton;

+ (instancetype)scanInputSettingViewWithFrame:(CGRect)frame
                         determineActionBlock:(DetermineActionBlock)determineActionBlock
                             scanfActionBlock:(dispatch_block_t)scanfActionBlock;
@end
