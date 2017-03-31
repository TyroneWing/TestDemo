//
//  IHWaterfallVC2.m
//  Demo
//
//  Created by ___liangdahong on 16/10/14.
//  Copyright © 2016年 http://idhong.com/. All rights reserved.
//

#import "IHWaterfallVC2.h"
#import "IHWaterfallCell2.h"
#import "IHWaterfallCollectionViewFlowLayout.h"
#import "SVProgressHUD.h"

#define kwidth  [UIScreen mainScreen].bounds.size.width
#define kheight [UIScreen mainScreen].bounds.size.height


@interface IHWaterfallVC2 ()<UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, WaterfallFlowLayoutDelegate>
@property (weak, nonatomic) IBOutlet UICollectionView *waterfall2CollectionView;
@property (nonatomic, strong) IHWaterfallCollectionViewFlowLayout *layout;
@property (strong, nonatomic) NSMutableArray *array;
@property (nonatomic, strong) NSMutableArray *itemHeights;       //布局数组

@end

@implementation IHWaterfallVC2

#pragma mark -
#pragma mark - init

- (void)viewDidLoad {
    [super viewDidLoad];
    self.waterfall2CollectionView.backgroundColor = [UIColor clearColor];
    self.waterfall2CollectionView.collectionViewLayout = self.layout;
    [self.waterfall2CollectionView registerNib:[UINib nibWithNibName:NSStringFromClass([IHWaterfallCell2 class]) bundle:nil] forCellWithReuseIdentifier:NSStringFromClass([IHWaterfallCell2 class])];
}

#pragma mark - getters setters
- (IHWaterfallCollectionViewFlowLayout *)layout {
    if (!_layout) {
        _layout = [[IHWaterfallCollectionViewFlowLayout alloc] init];
        _layout.delegate = self;
    }
    return _layout;
}

- (NSMutableArray *)array {
    
    if (!_array) {
        _array = [@[] mutableCopy];
        _itemHeights = [@[] mutableCopy];
        int arc = 100;
        if (arc4random_uniform(2)) {
            [SVProgressHUD showSuccessWithStatus:@"购物APP 商品浏览布局"];
            [_array addObject:[NSString stringWithFormat:@"%d",2]];
            [_itemHeights addObject:@(150)];
            for (int i = 0; i < arc; i ++) {
                [_itemHeights addObject:@(300)];
                [_array addObject:[NSString stringWithFormat:@"%d",i]];
            }
        }else{
            [SVProgressHUD showSuccessWithStatus:@"自由的瀑布流布局"];
            for (int i = 0; i < arc; i ++) {
                [_array addObject:[NSString stringWithFormat:@"%d",i]];
                [_itemHeights addObject:@(arc4random() % 300 + 30)];
            }
        }
    }
    return _array;
}

#pragma mark - 系统delegate
- (CGSize)collectionView:(UICollectionView *)collectionView collectionViewLayout:(IHWaterfallCollectionViewFlowLayout *)collectionViewLayout sizeOfItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake((SCREEN_WIDTH - 1 * 2) / 2, [_itemHeights[indexPath.row] floatValue]);
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.array.count;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    IHWaterfallCell2 *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([IHWaterfallCell2 class]) forIndexPath:indexPath];
    return cell;
}
#pragma mark - 自定义delegate
#pragma mark - 公有方法
#pragma mark - 私有方法
#pragma mark - 事件响应
@end
