//
//  SecondMenusCell.h
//  WPShopCenter
//
//  Created by 吴朋 on 2017/12/26.
//  Copyright © 2017年 吴朋. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SecondMenusCell : UITableViewCell

/**
 分类名称
 */
@property (nonatomic, copy) NSString *menusTitle;

/**
 选中cell的颜色
 */
@property (nonatomic, strong) UIColor *selectItemColor;

/**
 未选中时的颜色
 */
@property (nonatomic, strong) UIColor *normalItemColor;

/**
 cell是否选中 默认为NO
 */
@property (nonatomic, assign) BOOL cellSelected;

/**
 创建cell
 
 @param tableView 所属的tableView
 @return cell
 */
+ (instancetype)cellWithTableView:(UITableView *)tableView;

@end
