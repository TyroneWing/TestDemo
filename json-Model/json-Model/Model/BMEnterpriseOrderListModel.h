//
//  BMEnterpriseOrderListModel.h
//  BMBlueMoonAngel
//
//  Created by ___liangdahong on 2017/5/10.
//  Copyright © 2017年 月亮小屋（中国）有限公司. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 订单信息
 */
@interface BMEnterpriseOrderListModel : NSObject

@property (copy, nonatomic) NSString *branchCode;    ///< 机构编码
@property (copy, nonatomic) NSString *branchName;    ///< 机构名称
@property (copy, nonatomic) NSString *collectBrcode; ///< 收衣袋
@property (copy, nonatomic) NSString *outerCode;     ///< 订单编码

@end
