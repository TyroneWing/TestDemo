//
//  BMInputBaseVC.h
//  BMQRBarCode
//
//  Created by ___liangdahong on 16/9/1.
//  Copyright © 2016年 elvin. All rights reserved.
//

#import <UIKit/UIKit.h>

/*!
 *  @brief 洗衣服务二期 输入验证码界面BaseVC
 *  使用时继承于此控制器即可
 */
@interface BMInputBaseVC : UIViewController

/*!
 *  @brief 输入框
 */
@property (nonatomic, strong, readonly) UITextField *inputTextField;

/*!
 *  @brief 确定按钮
 */
@property (nonatomic, strong, readonly) UIButton *determineButton;

/*!
 *  @brief 扫描按钮
 */
@property (nonatomic, strong, readonly) UIButton *scanfButton;

/*!
 *  @brief 确定按钮点击
 *
 *  @param codeString 输入框中的字符串
 */
- (void)confirmButtonClickWithCodeString:(NSString *)codeString;

/*!
 *  @brief 扫描按钮点击
 */
- (void)scanCodeButtonClick;

@end
