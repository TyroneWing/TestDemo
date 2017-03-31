//
//  BMHomeVC.m
//  StartAnimation
//
//  Created by ___liangdahong on 2016/11/21.
//  Copyright © 2016年 http://idhong.com/. All rights reserved.
//

#import "BMHomeVC.h"
#import "BMHomeDrawerVC.h"
#import "BMStartAnimationView.h"
#import "Masonry.h"
#import "MJRefresh.h"
#import "BMMJRefreshGifHeader.h"
#import "BMHomeCollectionViewCell.h"
#import "BMHomeCollectionReusableViewHeader.h"
#import "BMHomeCollectionReusableViewFooter.h"
#import "BMHomeNewsView.h"

#define kwidth  [UIScreen mainScreen].bounds.size.width
#define kheight [UIScreen mainScreen].bounds.size.height

static NSString *kHomeCollectionViewCellIdentifier           = @"kHomeCollectionViewCellIdentifier";
static NSString *kHomeCollectionReusableViewHeaderIdentifier = @"kHomeCollectionReusableViewHeaderIdentifier";
static NSString *kHomeCollectionReusableViewFooterIdentifier = @"kHomeCollectionReusableViewFooterIdentifier";

@interface BMHomeVC () <UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UIGestureRecognizerDelegate>

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (nonatomic, strong) UICollectionViewFlowLayout *layout;
@property (nonatomic, strong) NSMutableArray *dataSourceArray;
@property (nonatomic, assign) CGFloat newsWidth;
@property (weak, nonatomic) IBOutlet BMHomeNewsView *homeNewsView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *newsHeightConstraint;

@end

@implementation BMHomeVC

#pragma mark -

#pragma mark - 生命周期

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.hidden = NO;
    self.navigationController.navigationBar.translucent = NO;
    [self setUI];
    [self reload];

    if (arc4random_uniform(2)) {
        self.homeNewsView.newsString = @"我是消息消息消息消息消息消息消息消息消息消息消息消息消息消息消息消息消息消息消息消息消息消息消息消息消息消息消息消息消息消息完~";
    }else {
        self.homeNewsView.newsString = @"我是消息消息消息消息消息消息消息消息消息消息消完~";
    }
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"扫描" style:0 target:self action:@selector(smClick)];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"user" style:0 target:self action:@selector(userClick)];

    self.homeNewsView.tapBlock = ^{
        [self.navigationController pushViewController:[UIViewController new] animated:YES];
    };
}

- (void)smClick {
    [self.navigationController pushViewController:[UIViewController new] animated:YES];
}

- (void)userClick {
    if (self.homeDrawerVC.openSide == MMDrawerSideLeft) {
        [self.homeDrawerVC closeDrawerAnimated:YES completion:nil];
        return;
    }
    [self.homeDrawerVC openDrawerSide:MMDrawerSideLeft animated:YES completion:nil];
}

#pragma mark - getters setters
- (UICollectionViewFlowLayout *)layout {
    if (!_layout) {
        _layout = [[UICollectionViewFlowLayout alloc] init];
        _layout.minimumLineSpacing = 0.5;
        _layout.minimumInteritemSpacing = 0.5;
        _layout.itemSize = CGSizeMake((kwidth-1.0)/3.0, (kwidth-1.0)/3.0);
        _layout.scrollDirection = UICollectionViewScrollDirectionVertical;
        _layout.headerReferenceSize = CGSizeMake(kwidth, 30);
        _layout.footerReferenceSize = CGSizeMake(kwidth, 30);
    }
    return _layout;
}

- (NSMutableArray *)dataSourceArray {
    if (!_dataSourceArray) {
        _dataSourceArray = [@[] mutableCopy];
    }
    return _dataSourceArray;
}

#pragma mark - 系统delegate

#pragma mark - UITableViewDelegate UITableViewDataSource

#pragma mark - UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UIGestureRecognizerDelegate

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return self.dataSourceArray.count;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    NSArray *array = self.dataSourceArray[section];
    return array.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    BMHomeCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kHomeCollectionViewCellIdentifier forIndexPath:indexPath];
    NSArray *array  = self.dataSourceArray[indexPath.section];
    id obj = array[indexPath.row];
    if ([obj isKindOfClass:[NSString class]]) {
        cell.label.text = (NSString *)obj;
        cell.iconImageView.hidden = NO;
    }else {
        cell.label.text = @"";
        cell.iconImageView.hidden = YES;
    }
    return cell;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    
    if (kind == UICollectionElementKindSectionHeader) {
        BMHomeCollectionReusableViewHeader *collectionReusableView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:kHomeCollectionReusableViewHeaderIdentifier forIndexPath:indexPath];
        return collectionReusableView;
    }else {
        BMHomeCollectionReusableViewFooter *collectionReusableView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:kHomeCollectionReusableViewFooterIdentifier forIndexPath:indexPath];
        return collectionReusableView;
    }
    return nil;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section {
    if (section+1 == self.dataSourceArray.count) {
        return CGSizeMake(kwidth, 30);
    }
    return CGSizeZero;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"--");
}

#pragma mark - 自定义delegate
#pragma mark - 公有方法
#pragma mark - 私有方法

- (void)setUI {
    
    if (self.animations) {
        BMStartAnimationView *startAnimationView = [BMStartAnimationView startAnimationView];
        // 添加启动动画
        [self.navigationController.view addSubview:startAnimationView];
        [startAnimationView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(0);
        }];
        [UIView animateWithDuration:1.5 animations:^{
            startAnimationView.alpha = 0.0f;
        } completion:^(BOOL finished) {
            [startAnimationView removeFromSuperview];
        }];
    }

    self.collectionView.backgroundColor = [UIColor clearColor];
    self.collectionView.collectionViewLayout = self.layout;

    [self.collectionView registerNib:[UINib nibWithNibName:NSStringFromClass([BMHomeCollectionViewCell class]) bundle:nil] forCellWithReuseIdentifier:kHomeCollectionViewCellIdentifier];
    
    [self.collectionView registerNib:[UINib nibWithNibName:NSStringFromClass([BMHomeCollectionReusableViewHeader class]) bundle:nil] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:kHomeCollectionReusableViewHeaderIdentifier];
    
    [self.collectionView registerNib:[UINib nibWithNibName:NSStringFromClass([BMHomeCollectionReusableViewFooter class]) bundle:nil] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:kHomeCollectionReusableViewFooterIdentifier];

    self.collectionView.header = [BMMJRefreshGifHeader headerWithRefreshingBlock:^{
        [self.collectionView.header beginRefreshing];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self.collectionView.header endRefreshing];
            [self reload];
            
            int arc = arc4random_uniform(3);
            if (arc == 0) {
                self.newsHeightConstraint.constant = 40.0;
                self.homeNewsView.newsString = @"我是消息消息消息消息消息消息消息消息消息消息消息消息消息消息消息消息消息消息消息消息消息消息消息消息消息消息消息消息消息消息完~";
            }else if (arc == 1) {
                self.newsHeightConstraint.constant = 40.0;
                self.homeNewsView.newsString = @"我是消息消息消息消息消息消息消完~";
            }
            else {
                self.homeNewsView.newsString = nil;
                self.newsHeightConstraint.constant = 0.0;
            }
        });
    }];
}

- (void)reload {
    [self.dataSourceArray removeAllObjects];
    int arc = arc4random_uniform(5)+2;
    int temp = 0;
    while (temp < arc) {
        int arcj = arc4random_uniform(14)+1;
        int tempj = 0;
        NSMutableArray *muarray = [@[] mutableCopy];
        while (tempj < arcj) {
            [muarray addObject:[NSString stringWithFormat:@"第%d组 功能 %d",temp,tempj++]];
        }
        temp++;
        [self.dataSourceArray addObject:muarray];
    }
    
    [self.dataSourceArray enumerateObjectsUsingBlock:^(NSArray * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if (obj.count % 3 != 0) {
            int temp = 3-obj.count%3;
            NSMutableArray *muarray = [obj mutableCopy];
            while (temp--) {
                [muarray addObject:@YES];
            }
            [self.dataSourceArray replaceObjectAtIndex:idx withObject:muarray];
        }
    }];
    [self.collectionView reloadData];
}

#pragma mark - 事件响应

@end
