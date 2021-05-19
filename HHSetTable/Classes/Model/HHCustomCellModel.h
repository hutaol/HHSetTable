//
//  HHCustomCellModel.h
//  Pods
//
//  Created by Henry on 2021/5/18.
//

#import <HHSetTable/HHSetTable.h>

NS_ASSUME_NONNULL_BEGIN

@interface HHCustomCellModel : HHBaseCellModel

/// 自定义模型初始化方法,请特别注意调用自定义模型方法后，cell必须自定义且存在
/// @param cellIdentifier 自定义cell类名，作为唯一标示符
/// @param block 回调
- (instancetype)initWithCellIdentifier:(NSString *)cellIdentifier actionBlock:(nullable ClickActionBlock)block;

@end

NS_ASSUME_NONNULL_END
