//
//  IHWaterfallVC3.m
//  Demo
//
//  Created by __liangdahong on 16/10/15.
//  Copyright © 2016年 http://idhong.com/. All rights reserved.
//

#import "IHWaterfallVC3.h"
#import "IHWaterCell3.h"
#define kwidth  [UIScreen mainScreen].bounds.size.width
#define kheight [UIScreen mainScreen].bounds.size.height
static NSString *kIHWaterCell3WithReuseIdentifier = @"kIHWaterCell3WithReuseIdentifier";


@interface IHWaterfallVC3 ()<UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property (weak, nonatomic) IBOutlet UICollectionView *waterfallCollection;
@property (nonatomic, strong) UICollectionViewFlowLayout *layout;
@property (strong, nonatomic) NSMutableArray *array;

@end

@implementation IHWaterfallVC3
- (UICollectionViewFlowLayout *)layout {
    if (!_layout) {
        _layout = [[UICollectionViewFlowLayout alloc] init];
        _layout.minimumLineSpacing = 10.0;
        _layout.minimumInteritemSpacing = 10.0;
        _layout.itemSize = CGSizeMake(kwidth/2.0, kheight-200);
        _layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    }
    return _layout;
}
- (NSMutableArray *)array {
    if (!_array) {
        _array = [@[] mutableCopy];
        int arc = 23;
        while (arc--) {
            [_array addObject:@(200)];
        }
    }
    return _array;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.waterfallCollection.backgroundColor = [UIColor clearColor];
    self.waterfallCollection.collectionViewLayout = self.layout;
    [self.waterfallCollection registerNib:[UINib nibWithNibName:NSStringFromClass([IHWaterCell3 class]) bundle:nil] forCellWithReuseIdentifier:kIHWaterCell3WithReuseIdentifier];
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.array.count;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    IHWaterCell3 *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kIHWaterCell3WithReuseIdentifier forIndexPath:indexPath];
    return cell;
}


@end
