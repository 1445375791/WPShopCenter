//
//  GoodsLeftView.m
//  WPShopCenter
//
//  Created by 吴朋 on 2017/12/25.
//  Copyright © 2017年 吴朋. All rights reserved.
//

#import "GoodsLeftView.h"
#import "SecondMenusCell.h"

@interface GoodsLeftView ()<UITableViewDelegate, UITableViewDataSource>

/**
 展示二级目录的视图
 */
@property(nonatomic, strong)UITableView *secondMenuTableView;

/**
 视图的frame
 */
@property (nonatomic, assign) CGRect viewFrame;

/**
 选中的位置
 */
@property (nonatomic, strong) NSIndexPath *selectIndexPath;

/**
 分割线
 */
@property (nonatomic, strong) UIView *spliteView;

@end

@implementation GoodsLeftView

/**
 初始化视图
 
 @param frame frame
 @return 视图
 */
- (instancetype)initTheLeftSecondDirectoryViewWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        _viewFrame = frame;
        _secondDirectoryMenus = @[].mutableCopy;
        _selectIndexPath = [NSIndexPath indexPathForRow:0 inSection:0];
        [self creatSecondMenuView];
        _spliteView = [[UIView alloc] initWithFrame:CGRectMake(CGRectGetWidth(self.bounds) - 0.5, 0, 0.5, CGRectGetHeight(self.bounds))];
        _spliteView.backgroundColor = [UIColor groupTableViewBackgroundColor];
        [self addSubview:_spliteView];
    }
    return self;
}

/**
 初始化二级目录视图
 */
- (void)creatSecondMenuView {
    _secondMenuTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.bounds) - 1, CGRectGetHeight(self.bounds)) style:UITableViewStylePlain];
    _secondMenuTableView.dataSource = self;
    _secondMenuTableView.delegate = self;
    _secondMenuTableView.tableFooterView = [[UIView alloc] init];
    _secondMenuTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self addSubview:_secondMenuTableView];
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _secondDirectoryMenus.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    SecondMenusCell *cell = [SecondMenusCell cellWithTableView:tableView];
    cell.menusTitle = _secondDirectoryMenus[indexPath.row];
    cell.cellSelected = _selectIndexPath == indexPath ? YES : NO;
    return cell;
}

#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 40;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (_selectIndexPath != indexPath) {
        SecondMenusCell *preCell = (SecondMenusCell *)[tableView cellForRowAtIndexPath:_selectIndexPath];
        preCell.cellSelected = NO;
        
        SecondMenusCell *currentCell = (SecondMenusCell *)[tableView cellForRowAtIndexPath:indexPath];
        currentCell.cellSelected = YES;
        _selectIndexPath = indexPath;
        if (self.selectSecondBlock) {
            self.selectSecondBlock(currentCell.menusTitle);
        }
    }
}


/**
 选中之后的回调
 
 @param clickBlock 回调
 */
- (void)didSelectedTheItemWithBlock:(SelectSecondMenuBlock)clickBlock {
    self.selectSecondBlock = clickBlock;
}

/**
 重置选中
 */
- (void)resetSelectedMenus {
    _selectIndexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    [_secondMenuTableView reloadData];
}


#pragma mark - Setter Method
- (void)setSecondDirectoryMenus:(NSMutableArray<NSString *> *)secondDirectoryMenus {
    _secondDirectoryMenus = secondDirectoryMenus;
    [_secondMenuTableView reloadData];
}

@end
