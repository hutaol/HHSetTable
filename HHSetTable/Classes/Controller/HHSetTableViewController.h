//
//  HHSetTableViewController.h
//  Pods
//
//  Created by Henry on 2021/5/17.
//

#import <UIKit/UIKit.h>
@class HHBaseCellModel;

NS_ASSUME_NONNULL_BEGIN

@interface HHSetTableViewController : UITableViewController

@property (nonatomic, strong) NSMutableArray *dataArray;  ///  数据源

- (void)updateCellModel:(HHBaseCellModel *)cellModel;

- (void)updateCellModel:(HHBaseCellModel *)cellModel animation:(UITableViewRowAnimation)animation;

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section;

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section;

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section;

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section;

@end

NS_ASSUME_NONNULL_END
