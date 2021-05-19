//
//  HHBaseCellModel.h
//  Pods
//
//  Created by Henry on 2021/5/17.
//

#import <Foundation/Foundation.h>
@class HHBaseCellModel;

NS_ASSUME_NONNULL_BEGIN

typedef void(^ClickActionBlock)(HHBaseCellModel *model);

@interface HHBaseCellModel : NSObject

/// 唯一标识符(更新会用到)
@property (nonatomic, copy, readonly) NSString *identifier;
/// 该模型绑定的cell类名
@property (nonatomic, copy, readonly) NSString *cellClass;
@property (nonatomic, strong) UIColor *backgroundColor;
/// 选中cell效果
@property (nonatomic, assign) UITableViewCellSelectionStyle selectionStyle;
/// cell高度(默认44)
@property (nonatomic, assign) CGFloat cellHeight;

/// TODO 分割线暂未实现
/// 分割线高度
@property (nonatomic, assign) CGFloat separateHeight;
/// 分割线颜色
@property (nonatomic, strong) UIColor *separateColor;
/// 分割线左边间距(默认为0)
@property (nonatomic, assign) CGFloat separateOffset;
/// cell点击事件
@property (nonatomic, copy) ClickActionBlock actionBlock;

@end

NS_ASSUME_NONNULL_END
