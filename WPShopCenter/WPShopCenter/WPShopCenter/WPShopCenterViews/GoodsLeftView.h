//
//  GoodsLeftView.h
//  WPShopCenter
//
//  Created by 吴朋 on 2017/12/25.
//  Copyright © 2017年 吴朋. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^SelectSecondMenuBlock)(NSString *menuTitle);

@interface GoodsLeftView : UIView

/**
 二级目录
 */
@property (nonatomic, strong) NSMutableArray<NSString *> *secondDirectoryMenus;

/**
 选中block
 */
@property (nonatomic, copy) SelectSecondMenuBlock selectSecondBlock;


/**
 初始化视图

 @param frame frame
 @return 视图
 */
- (instancetype)initTheLeftSecondDirectoryViewWithFrame:(CGRect)frame;

/**
 选中之后的回调

 @param clickBlock 回调
 */
- (void)didSelectedTheItemWithBlock:(SelectSecondMenuBlock)clickBlock;

/**
 重置选中
 */
- (void)resetSelectedMenus;

@end
