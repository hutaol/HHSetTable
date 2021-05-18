//
//  UIViewController+HHSetTableView.h
//  Pods
//
//  Created by Henry on 2021/5/18.
//

#import <UIKit/UIKit.h>
@class HHBaseCellModel, HHSectionModel;

NS_ASSUME_NONNULL_BEGIN

@interface UIViewController (HHSetTableView)

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) NSMutableArray *dataArray;

- (void)initSetTableViewConfigureStyle:(UITableViewStyle)style;

- (void)setupTableViewConstrint:(CGFloat)top left:(CGFloat)left right:(CGFloat)right bottom:(CGFloat)bottom;

- (void)setupTableViewHeaderArray:(NSMutableArray <HHSectionModel *> *)headerArray;

- (void)setupTableViewFooterArray:(NSMutableArray <HHSectionModel *>*)footerArray;

- (void)updateCellModel:(HHBaseCellModel *)cellModel;

- (void)updateCellModel:(HHBaseCellModel *)cellModel animation:(UITableViewRowAnimation)animation;

@end

NS_ASSUME_NONNULL_END
