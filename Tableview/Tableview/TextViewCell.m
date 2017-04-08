//
//  TextViewCell.m
//  Tableview
//
//  Created by yi on 17/4/8.
//  Copyright © 2017年 yi. All rights reserved.
//

#import "TextViewCell.h"

@implementation TextViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    _textView.autocorrectionType = UITextAutocorrectionTypeNo;
    _textView.spellCheckingType = UITextSpellCheckingTypeNo;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


- (void)textViewDidChange:(UITextView *)textView
{
    NSLog(@"textViewDidChange");
    CGRect bounds = textView.bounds;
    // 计算 text view 的高度
    CGSize maxSize = CGSizeMake(bounds.size.width, CGFLOAT_MAX);
    CGSize newSize = [textView sizeThatFits:maxSize];
    bounds.size = newSize;
    textView.bounds = bounds;
    // 让 table view 重新计算高度
    UITableView *tableView = [self tableView];
    [tableView beginUpdates];
    [tableView endUpdates];
}
- (UITableView *)tableView
{
    UIView *tableView = self.superview;
    while (![tableView isKindOfClass:[UITableView class]] && tableView) {
        tableView = tableView.superview;
    }
    return (UITableView *)tableView;
}

@end
