//
//  BMEmployeeInfoModel.h
//  BMBlueMoonAngel
//
//  Created by ___liangdahong on 2017/5/2.
//  Copyright © 2017年 月亮小屋（中国）有限公司. All rights reserved.
//

#import <Foundation/Foundation.h>


/**
 员工信息
 */
@interface BMEmployeeInfoModel : NSObject

@property (copy, nonatomic) NSString *branchCode;        ///< 机构编码（默认）
@property (copy, nonatomic) NSString *branchName;        ///< 机构名称（默认）
@property (copy, nonatomic) NSString *employeeCode;      ///< 账户id
@property (copy, nonatomic) NSString *employeeExtension; ///< 分机号
@property (copy, nonatomic) NSString *employeeName;      ///< 员工姓名
@property (copy, nonatomic) NSString *employeePhone;     ///< 员工手机号

@end
