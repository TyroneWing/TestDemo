//
//  BMEFCSearchModel.h
//  BMBlueMoonAngel
//
//  Created by ___liangdahong on 2017/5/10.
//  Copyright © 2017年 月亮小屋（中国）有限公司. All rights reserved.
//

#import <Foundation/Foundation.h>

@class BMEnterpriseOrderListModel, BMEmployeeInfoModel;
/**
 手动搜索结果模型
 */
@interface BMEFCSearchModel : NSObject

@property (copy, nonatomic) NSArray <BMEmployeeInfoModel *> *employeeList; ///< 员工信息
@property (copy, nonatomic) NSArray <BMEnterpriseOrderListModel *> *enterpriseOrderList; ///< 订单信息

@end
