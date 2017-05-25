//
//  BMEFCSearchModel.m
//  BMBlueMoonAngel
//
//  Created by ___liangdahong on 2017/5/10.
//  Copyright © 2017年 月亮小屋（中国）有限公司. All rights reserved.
//

#import "BMEFCSearchModel.h"
#import "BMEnterpriseOrderListModel.h"
#import "BMEmployeeInfoModel.h"

@implementation BMEFCSearchModel

+ (NSDictionary *)mj_objectClassInArray {
    
    return @{@"employeeList" : [BMEmployeeInfoModel class],
             @"enterpriseOrderList" : [BMEnterpriseOrderListModel class]
             };
}
@end
