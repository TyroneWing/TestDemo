//
//  IHWaterfallVC.m
//  Demo
//
//  Created by __liangdahong on 16/10/14.
//  Copyright © 2016年 http://idhong.com/. All rights reserved.
//

#import "IHWaterfallVC.h"
#import "IHWaterCell.h"
#define kwidth  [UIScreen mainScreen].bounds.size.width
#define kheight [UIScreen mainScreen].bounds.size.height
static NSString *kCellWithReuseIdentifier = @"kCellWithReuseIdentifier";

@interface IHWaterfallVC ()<UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property (weak, nonatomic) IBOutlet UICollectionView *waterfallCollection;
@property (nonatomic, strong) UICollectionViewFlowLayout *layout;
@property (strong, nonatomic) NSMutableArray *array;
@end

@implementation IHWaterfallVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.waterfallCollection.backgroundColor = [UIColor clearColor];
    self.waterfallCollection.collectionViewLayout = self.layout;
    [self.waterfallCollection registerNib:[UINib nibWithNibName:NSStringFromClass([IHWaterCell class]) bundle:nil] forCellWithReuseIdentifier:kCellWithReuseIdentifier];
}

#pragma mark -
#pragma mark - init
#pragma mark - 生命周期
#pragma mark - getters setters
- (UICollectionViewFlowLayout *)layout {
    if (!_layout) {
        _layout = [[UICollectionViewFlowLayout alloc] init];
        _layout.minimumLineSpacing = 1.0;
        _layout.minimumInteritemSpacing = 1.0;
        _layout.itemSize = CGSizeMake(100, 100);
        _layout.scrollDirection = UICollectionViewScrollDirectionVertical;
    }
    return _layout;
}

- (NSMutableArray *)array {
    if (!_array) {
        _array = [@[] mutableCopy];
        int arc = 100;
        while (arc--) {
            [_array addObject:@(200)];
        }
    }
    return _array;
}

 #pragma mark - 系统delegate
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.array.count;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    IHWaterCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kCellWithReuseIdentifier forIndexPath:indexPath];
    return cell;
}
#pragma mark - 自定义delegate
#pragma mark - 公有方法
#pragma mark - 私有方法
#pragma mark - 事件响应
@end
