//
//  HHTextCellModel.h
//  HHSetTable
//
//  Created by Henry on 2021/5/18.
//

#import "HHTitleCellModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface HHTextCellModel : HHTitleCellModel

/// 详细文本
@property (nonatomic, copy) NSString *detailText;
/// 设置富文本内容后detailText将失效
@property (nonatomic, copy) NSAttributedString *attributeDetailText;
/// 详细文本颜色
@property (nonatomic, strong) UIColor *detailColor;
/// 详细文本字体（多行会改变行高，保持行高不变，cellHeight后设置）
@property (nonatomic, strong) UIFont *detailFont;
/// 详细文本行数 （文本多行，富文本一行）
@property (nonatomic, assign) NSInteger detailNumberOfLines;


/// 文本初始化
/// @param title 标题
/// @param detailText 详细文本
/// @param block 回调
- (instancetype)initWithTitle:(NSString *)title detailText:(NSString *)detailText actionBlock:(nullable ClickActionBlock)block;

/// 文本初始化
/// @param title 标题
/// @param attributeDetailText 详细富文本
/// @param block 回调
- (instancetype)initWithTitle:(NSString *)title attributrDetailText:(NSAttributedString *)attributeDetailText actionBlock:(nullable ClickActionBlock)block;

/// 文本初始化
/// @param attributeTitle 富文本标题
/// @param attributeDetailText 详细富文本
/// @param block 回调
- (instancetype)initWithAttributeTitle:(NSAttributedString *)attributeTitle detailAttributeText:(NSAttributedString *)attributeDetailText actionBlock:(nullable ClickActionBlock)block;

/// 文本初始化
/// @param attributeTitle 富文本标题
/// @param detailText 详细文本
/// @param block 回调
- (instancetype)initWithAttributeTitle:(NSAttributedString *)attributeTitle detailText:(nullable NSString *)detailText actionBlock:(ClickActionBlock)block;

@end

NS_ASSUME_NONNULL_END
