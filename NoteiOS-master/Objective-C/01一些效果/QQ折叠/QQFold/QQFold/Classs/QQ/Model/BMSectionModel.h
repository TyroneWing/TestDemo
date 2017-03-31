//
//  BMSectionModel.h
//  QQ
//
//  Created by __liangdahong on 16/9/2.
//  Copyright © 2016年 梁大红. All rights reserved.
//

#import "BMUser.h"
#import <Foundation/Foundation.h>

@interface BMSectionModel : NSObject

@property (copy, nonatomic) NSString *scetionName;
@property (assign, nonatomic, getter=isOpen) BOOL open;
@property (copy, nonatomic) NSArray <BMUser *>*personArray;
@end
