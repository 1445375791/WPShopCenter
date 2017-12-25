//
//  GoodsTopView.m
//  WPShopCenter
//
//  Created by 吴朋 on 2017/12/25.
//  Copyright © 2017年 吴朋. All rights reserved.
//

#import "GoodsTopView.h"
#import "GoodsMenusCell.h"

@interface GoodsTopView()<UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

/**
 展示类别的视图
 */
@property (nonatomic, strong) UICollectionView *menuCollectionView;

/**
 视图的frame
 */
@property (nonatomic, assign) CGRect viewFrame;

@property (nonatomic, strong) NSIndexPath *selectIndexPath;

@end

@implementation GoodsTopView

- (instancetype)initTheTopGoodsViewWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        _viewFrame = frame;
        _goodsMenus = @[].mutableCopy;
        _selectIndexPath = [NSIndexPath indexPathForRow:0 inSection:0];
        [self creatMenusCollectionView];
    }
    return self;
}

/**
 创建CollectionView
 */
- (void)creatMenusCollectionView {
    
    UICollectionViewFlowLayout *viewLayout = [[UICollectionViewFlowLayout alloc] init];
    viewLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    _menuCollectionView = [[UICollectionView alloc] initWithFrame:self.bounds collectionViewLayout:viewLayout];
    _menuCollectionView.backgroundColor = [UIColor whiteColor];
    _menuCollectionView.dataSource = self;
    _menuCollectionView.delegate = self;
    _menuCollectionView.showsHorizontalScrollIndicator = NO;
    _menuCollectionView.showsVerticalScrollIndicator = NO;
    [_menuCollectionView registerClass:[GoodsMenusCell class] forCellWithReuseIdentifier:NSStringFromClass([GoodsMenusCell class])];
    [self addSubview:_menuCollectionView];
}

#pragma mark - UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return _goodsMenus.count;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    GoodsMenusCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([GoodsMenusCell class]) forIndexPath:indexPath];
    cell.title = _goodsMenus[indexPath.row];
    cell.cellSelected = _selectIndexPath == indexPath ? YES : NO;
//    cell.normalColor = [UIColor blackColor];
//    cell.selectedColor = [UIColor purpleColor];
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(60, 30);
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(7, 5, 7, 5);
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    if (_selectIndexPath != indexPath) {
        // 获取之前点击的cell
        GoodsMenusCell *preCell = (GoodsMenusCell *)[collectionView cellForItemAtIndexPath:_selectIndexPath];
        preCell.cellSelected = NO;
        
        // 获取当前点击的cell
        GoodsMenusCell *cell = (GoodsMenusCell *)[collectionView cellForItemAtIndexPath:indexPath];
        cell.cellSelected = YES;
        _selectIndexPath = indexPath;
        
        if (self.selectBlock) {
            self.selectBlock(cell.title);
        }
    }
    
}

/**
 点击选择的类目
 
 @param selectMenuBlock 选择之后的回调
 */
- (void)didSelectGoodsMenusWithBlock:(SelectGoodMenuBlock)selectMenuBlock {
    self.selectBlock = selectMenuBlock;
}


#pragma mark - Setter 

- (void)setGoodsMenus:(NSMutableArray<NSString *> *)goodsMenus {
    _goodsMenus = goodsMenus;
    [_menuCollectionView reloadData];
}

- (void)dealloc
{
    NSLog(@"dealloc");
}

@end
