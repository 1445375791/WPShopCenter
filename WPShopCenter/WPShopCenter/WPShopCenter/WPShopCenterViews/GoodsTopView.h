//
//  GoodsTopView.h
//  WPShopCenter
//
//  Created by 吴朋 on 2017/12/25.
//  Copyright © 2017年 吴朋. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^SelectGoodMenuBlock)(NSString *menuTitle);

@interface GoodsTopView : UIView

/**
 商品种类 只能存放NSString类型
 */
@property (nonatomic, strong) NSMutableArray<NSString *> *goodsMenus;

/**
 点击选择的栏目
 */
@property (nonatomic, copy) SelectGoodMenuBlock selectBlock;

/**
 初始化视图

 @param frame frame
 @return 视图对象
 */
- (instancetype)initTheTopGoodsViewWithFrame:(CGRect)frame;

/**
 点击选择的类目

 @param selectMenuBlock 选择之后的回调
 */
- (void)didSelectGoodsMenusWithBlock:(SelectGoodMenuBlock)selectMenuBlock;


@end
