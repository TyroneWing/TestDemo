//
//  TextViewCell.h
//  Tableview
//
//  Created by yi on 17/4/8.
//  Copyright © 2017年 yi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TextViewCell : UITableViewCell <UITextViewDelegate>
@property (weak, nonatomic) IBOutlet UITextView *textView;
@end

