//
//  GoodsListView.h
//  WPShopCenter
//
//  Created by 吴朋 on 2017/12/25.
//  Copyright © 2017年 吴朋. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum : NSUInteger {
    WPGoodsShowTypeTableView,       // tableView展示
    WPGoodsShowTypeCollectionView,  // collectionView展示
} WPGoodsShowType;

@class WPGoodsModel;
@interface GoodsListView : UIView

/**
 商品数组
 */
@property (nonatomic, strong) NSMutableArray<WPGoodsModel *> *goods;

/**
 展示的形式
 */
@property (nonatomic, assign) WPGoodsShowType goodsShowType;

/**
 初始化数据

 @param frame frame
 @return 对象
 */
- (instancetype)initListViewWithFrame:(CGRect)frame;

@end
