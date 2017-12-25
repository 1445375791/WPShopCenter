//
//  GoodsMenusCell.h
//  WPShopCenter
//
//  Created by 吴朋 on 2017/12/25.
//  Copyright © 2017年 吴朋. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GoodsMenusCell : UICollectionViewCell

/**
 显示的类目
 */
@property (nonatomic, copy) NSString *title;

/**
 是否选中
 */
@property (nonatomic, assign) BOOL cellSelected;

/**
 未选中时的颜色
 */
@property (nonatomic, strong) UIColor *normalColor;

/**
 选中时的颜色
 */
@property (nonatomic, strong) UIColor *selectedColor;
@end
