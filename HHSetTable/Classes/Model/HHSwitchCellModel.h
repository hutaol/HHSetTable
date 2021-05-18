//
//  HHSwitchCellModel.h
//  Pods
//
//  Created by Henry on 2021/5/18.
//

#import "HHTitleCellModel.h"

NS_ASSUME_NONNULL_BEGIN

typedef void(^SwitchBlock)(HHBaseCellModel *model, BOOL on);

@interface HHSwitchCellModel : HHTitleCellModel

/// 开关状态
@property (nonatomic, assign) BOOL on;
/// 开关颜色
@property (nonatomic, strong) UIColor *onTintColor;
/// block调用
@property (nonatomic, copy) SwitchBlock switchBlock;

/// 初始化方法
/// @param title 标题
/// @param on 开关状态
/// @param block 回调
- (instancetype)initWithTitle:(NSString *)title switchType:(BOOL)on switchBlock:(SwitchBlock)block;


@end

NS_ASSUME_NONNULL_END
