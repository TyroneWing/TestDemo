//
//  BMVersionUpdateManager.h
//  BMBlueMoonAngel
//
//  Created by ___liangdahong on 16/8/22.
//  Copyright © 2016年 elvin. All rights reserved.
//

#import <Foundation/Foundation.h>

/*!
 *  @brief 检测新版本成功 Block
 *
 *  @param isNeedUpdate  是否有新版本
 *  @param version       buildVersion
 *  @param buildVersion  buildVersion
 *  @param isForceUpdate 是否强制更新
 *  @param download      url
 *  @param description   desc
 */
typedef void(^BMVersionUpdateSuccess)(BOOL isNeedUpdate,
                                      NSString *version,
                                      NSString *buildVersion,
                                      BOOL isForceUpdate,
                                      NSString *download,
                                      NSString *description);
/*!
 *  @brief 检查新版本失败
 *
 *  @param error error
 */
typedef void(^BMVersionUpdateFailure)(NSError *error);


@interface BMVersionUpdateManager : NSObject

/*!
 *  @brief 获取版本管理者
 */
+ (instancetype)sharedVersionUpdateManager;

/*!
 *  @brief 自动检查版本情况 （内部做相逻辑处理）
 */
- (void)automaticCheckVersion;

/*!
 *  @brief 手动检查新版本情况
 *
 *  @param success 成功
 *  @param failure 失败
 */
- (void)checkVersionUpdate:(BMVersionUpdateSuccess)success failure:(BMVersionUpdateFailure)failure;

// 限制外部调用 new 方法
+ (instancetype)new UNAVAILABLE_ATTRIBUTE;

@end
