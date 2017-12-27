//
//  GoodsListView.m
//  WPShopCenter
//
//  Created by 吴朋 on 2017/12/25.
//  Copyright © 2017年 吴朋. All rights reserved.
//

#import "GoodsListView.h"
#import "WPGoodsModel.h"
#import "GoodsListViewCell.h"
#import "GoodsCollectionCell.h"

@interface GoodsListView () <UITableViewDelegate, UITableViewDataSource, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

/**
 tableView展示
 */
@property (nonatomic, strong) UITableView *goodsTableView;

/**
 collectionView展示
 */
@property (nonatomic, strong) UICollectionView *goodsCollectionView;

/**
 视图的frame
 */
@property (nonatomic, assign) CGRect viewFrame;

@end

@implementation GoodsListView

/**
 初始化数据
 
 @param frame frame
 @return 对象
 */
- (instancetype)initListViewWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        _viewFrame = frame;
        _goodsShowType = WPGoodsShowTypeCollectionView;
        [self createShowGoodsView];
    }
    return self;
}

/**
 创建展示视图
 */
- (void)createShowGoodsView {
    if (_goodsShowType == WPGoodsShowTypeTableView) {
        [self addSubview:self.goodsTableView];
    } else {
        [self addSubview:self.goodsCollectionView];
    }
}

#pragma mark - Getter 
- (UITableView *)goodsTableView {
    if (!_goodsTableView) {
        _goodsTableView = [[UITableView alloc] initWithFrame:self.bounds style:UITableViewStylePlain];
        _goodsTableView.backgroundColor = [UIColor groupTableViewBackgroundColor];
        _goodsTableView.dataSource = self;
        _goodsTableView.delegate = self;
        _goodsTableView.tableFooterView = [[UIView alloc] init];
        _goodsTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return _goodsTableView;
}

- (UICollectionView *)goodsCollectionView {
    if (!_goodsCollectionView) {
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
        _goodsCollectionView = [[UICollectionView alloc] initWithFrame:self.bounds collectionViewLayout:flowLayout];
        _goodsCollectionView.backgroundColor = [UIColor groupTableViewBackgroundColor];
        _goodsCollectionView.dataSource = self;
        _goodsCollectionView.delegate = self;
        [_goodsCollectionView registerClass:[GoodsCollectionCell class] forCellWithReuseIdentifier:NSStringFromClass([GoodsCollectionCell class])];
    }
    return _goodsCollectionView;
}

#pragma mark - Setter
- (void)setGoods:(NSMutableArray<WPGoodsModel *> *)goods {
    _goods = goods;
    if (self.goodsShowType == WPGoodsShowTypeTableView) {
        [_goodsTableView reloadData];
    } else {
        [_goodsCollectionView reloadData];
    }
}

- (void)setGoodsShowType:(WPGoodsShowType)goodsShowType {
    if (_goodsShowType != goodsShowType) {
        _goodsShowType = goodsShowType;
        if (goodsShowType == WPGoodsShowTypeTableView) {
            [_goodsCollectionView removeFromSuperview];
            _goodsCollectionView.dataSource = nil;
            _goodsCollectionView.delegate = nil;
            _goodsCollectionView = nil;
            [self addSubview:self.goodsTableView];
        } else {
            [_goodsTableView removeFromSuperview];
            _goodsTableView.delegate = nil;
            _goodsTableView.dataSource = nil;
            _goodsTableView = nil;
            [self addSubview:self.goodsCollectionView];
        }
    }
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _goods.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    GoodsListViewCell *cell = [GoodsListViewCell cellWithTableView:tableView];
    if (_goods && _goods.count > 0) {
        [cell buildTheViewCellWithModel:_goods[indexPath.row]];
    }
    return cell;
}

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    WPGoodsModel *model = _goods[indexPath.row];
    if (self.selectModelBlock) {
        self.selectModelBlock(model);
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 90;
}


#pragma mark - UICollectionViewDataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return _goods.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    GoodsCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([GoodsCollectionCell class]) forIndexPath:indexPath];
    if (_goods && _goods.count > 0) {
        [cell buildTheViewCellWithModel:_goods[indexPath.row]];
    }
    return cell;
}

#pragma mark - UICollectionViewDelegateFlowLayout
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    CGFloat itemWidth = _viewFrame.size.width / 2.0 - 10;
    return CGSizeMake(itemWidth, itemWidth + 50);
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(5, 5, 10, 5);
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    return 10;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return 10;
}

#pragma mark - UICollectionViewDelegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    WPGoodsModel *model = _goods[indexPath.row];
    if (self.selectModelBlock) {
        self.selectModelBlock(model);
    }
}

- (void)didSelectModelItemWithBlock:(SelectModelItemBlock)selectBlock {
    self.selectModelBlock = selectBlock;
}


@end
