//
//  BMLoginControllerView.h
//  StartAnimation
//
//  Created by ___liangdahong on 2016/11/21.
//  Copyright © 2016年 http://idhong.com/. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 登录按钮点击回调block
 
 @param userName 用户名
 @param password 密码
 */
typedef void(^BMLoginActionBlock)(NSString *userName, NSString *password);

/**
 登录界面view
 */
@interface BMLoginControllerView : UIView

/**
 用户名 TextField
 */
@property (weak, nonatomic) IBOutlet UITextField *userTextField;


/**
 密码 TextField
 */
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;

/**
 忘记密码按钮
 */
@property (weak, nonatomic) IBOutlet UIButton *forgetpasswordButton;

/**
 类方法创建登录界面 view

 @param loginActionBlock 登录按钮点击block
 @param forgetpasswordActionBlock 忘记密码按钮点击block
 @return 创建的 view
 */
+ (instancetype)loginControllerViewWithLoginActionBlock:(BMLoginActionBlock)loginActionBlock
                    forgetpasswordActionBlock:(dispatch_block_t)forgetpasswordActionBlock;
@end
