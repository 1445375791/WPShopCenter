//
//  GoodsTopView.h
//  WPShopCenter
//
//  Created by 吴朋 on 2017/12/25.
//  Copyright © 2017年 吴朋. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GoodsTopView : UIView

/**
 商品种类 只能存放NSString类型
 */
@property (nonatomic, strong) NSMutableArray<NSString *> *goodsMenus;


/**
 初始化视图

 @param frame frame
 @return 视图对象
 */
- (instancetype)initTheTopGoodsViewWithFrame:(CGRect)frame;


@end
