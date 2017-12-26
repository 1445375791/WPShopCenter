//
//  GoodsListViewCell.h
//  WPShopCenter
//
//  Created by 吴朋 on 2017/12/26.
//  Copyright © 2017年 吴朋. All rights reserved.
//

#import <UIKit/UIKit.h>
@class WPGoodsModel;
@interface GoodsListViewCell : UITableViewCell

/**
 创建cell
 
 @param tableView 所属的tableView
 @return cell
 */
+ (instancetype)cellWithTableView:(UITableView *)tableView;

/**
 给视图赋值

 @param model 对象
 */
- (void)buildTheViewCellWithModel:(WPGoodsModel *)model;

@end
