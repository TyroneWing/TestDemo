//
//  BMHomeVC.m
//  UICollectionViewEditor
//
//  Created by ___liangdahong on 2017/4/13.
//  Copyright © 2017年 月亮小屋（中国）有限公司. All rights reserved.
//

#import "BMHomeVC.h"
#import "BMCell.h"

@interface BMHomeVC () <UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UIGestureRecognizerDelegate>

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (nonatomic, strong) UICollectionViewFlowLayout *layout;
@property (nonatomic, strong) NSMutableArray *dataSourceArray;
@property (strong, nonatomic) UITableView *a; ///< <#Description#>
@end

static NSString *kCellReuseIdentifier = @"kCellReuseIdentifier";
@implementation BMHomeVC

#pragma mark -

#pragma mark - 生命周期

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    [self setUI];
}

#pragma mark - getters setters

- (NSMutableArray *)dataSourceArray {
    if (!_dataSourceArray) {
        _dataSourceArray = [@[] mutableCopy];
        int arc = arc4random_uniform(40) + 50;
        while (arc--) {
            [_dataSourceArray addObject:@"c"];
        }
    }
    return _dataSourceArray;
}

- (UICollectionViewFlowLayout *)layout {
    if (!_layout) {
        _layout = [[UICollectionViewFlowLayout alloc] init];
        _layout.minimumLineSpacing = 3;
        _layout.minimumInteritemSpacing = 3;
        _layout.itemSize = CGSizeMake(100, 80);
        _layout.scrollDirection = UICollectionViewScrollDirectionVertical;
    }
    return _layout;
}

#pragma mark - 系统delegate

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.dataSourceArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    BMCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kCellReuseIdentifier forIndexPath:indexPath];
    cell.contentView.backgroundColor = [UIColor colorWithRed:arc4random_uniform(255)/255.0 green:arc4random_uniform(255)/255.0 blue:arc4random_uniform(255)/255.0 alpha:1];
    return cell;
}

- (BOOL)collectionView:(UICollectionView *)collectionView canMoveItemAtIndexPath:(NSIndexPath *)indexPath {
    //返回YES允许其item移动
    return YES;
}

- (void)collectionView:(UICollectionView *)collectionView moveItemAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath*)destinationIndexPath {
    [self.dataSourceArray exchangeObjectAtIndex:sourceIndexPath.row withObjectAtIndex:destinationIndexPath.row];
}

- (void)collectionView:(UICollectionView *)collectionView didHighlightItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewCell *selectedCell = [collectionView cellForItemAtIndexPath:indexPath];
    [collectionView bringSubviewToFront:selectedCell];
    [UIView animateWithDuration:0.2 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
        selectedCell.transform = CGAffineTransformMakeScale(1.2f, 1.2f);
    } completion:nil];
}

- (void)collectionView:(UICollectionView *)collectionView didUnhighlightItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewCell *selectedCell = [collectionView cellForItemAtIndexPath:indexPath];
    [UIView animateWithDuration:0.2 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        selectedCell.transform = CGAffineTransformMakeScale(1.0f, 1.0f);
    } completion:nil];
}

#pragma mark - 自定义delegate

#pragma mark - 公有方法

#pragma mark - 私有方法

- (void)setUI {
    self.navigationController.navigationBar.hidden = NO;
    self.navigationController.navigationBar.translucent = NO;
    self.collectionView.collectionViewLayout = self.layout;
    [self.collectionView registerNib:[UINib nibWithNibName:NSStringFromClass([BMCell class]) bundle:nil] forCellWithReuseIdentifier:kCellReuseIdentifier];
    UILongPressGestureRecognizer *lon = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longPressGestureRecognizer:)];
    [self.collectionView addGestureRecognizer:lon];
}

#pragma mark - 事件响应

- (void)longPressGestureRecognizer:(UILongPressGestureRecognizer *)longGesture {

    switch (longGesture.state) {

            // 手势开始
        case UIGestureRecognizerStateBegan: {
            // 获取当前手势的接触点在哪一个cell 上
            NSIndexPath *indexPath = [self.collectionView indexPathForItemAtPoint:[longGesture locationInView:self.collectionView]];
            // 如果没有在如果cell上就返回
            if (indexPath == nil) {
                break;
            }
            // 获取到这个cell
            UICollectionViewCell *cell = [self.collectionView cellForItemAtIndexPath:indexPath];
            // 把cell 移动到最前面
            [self.collectionView bringSubviewToFront:cell];
            //在collectionVie上则开始移动该Item的cell
            [self.collectionView beginInteractiveMovementForItemAtIndexPath:indexPath];
        }
            break;

            // 手势改变（手势移动）
        case UIGestureRecognizerStateChanged:{
            // 移动过程当中随时更新cell位置
            [self.collectionView updateInteractiveMovementTargetPosition:[longGesture locationInView:self.collectionView]];
        }
            break;
            // 手势结束
        case UIGestureRecognizerStateEnded:{
            // 移动结束后关闭cell移动
            [self.collectionView endInteractiveMovement];
        }
            break;
        default:
            // 手势其他状态
            [self.collectionView cancelInteractiveMovement];
            break;
    }
}

@end
