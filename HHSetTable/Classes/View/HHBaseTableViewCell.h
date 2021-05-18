//
//  HHBaseTableViewCell.h
//  Pods
//
//  Created by Henry on 2021/5/17.
//

#import <UIKit/UIKit.h>
@class HHBaseCellModel;

NS_ASSUME_NONNULL_BEGIN

@interface HHBaseTableViewCell : UITableViewCell

/// cellModel
@property (nonatomic, strong) HHBaseCellModel *cellModel;

//cell初始化方法
+ (HHBaseTableViewCell *)cellWithIdentifier:(NSString *)cellIdentifier tableView:(UITableView *)tableView;

///初始化UI方法
- (void)setupUI;

///设置数据源方法
- (void)setupDataModel:(HHBaseCellModel *)model;

///获取cell高度方法
+ (CGFloat)getCellHeight:(HHBaseCellModel *)model;

@end

NS_ASSUME_NONNULL_END
