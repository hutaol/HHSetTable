//
//  HHTitleCellModel.h
//  Pods
//
//  Created by Henry on 2021/5/17.
//

#import "HHBaseCellModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface HHTitleCellModel : HHBaseCellModel

/// cell富文本标题(如果设置了这个，title属性将失效)
@property (nonatomic, copy) NSAttributedString *attributeTitle;
/// cell标题(默认左边)
@property (nonatomic, copy) NSString *title;
/// cell左边标题样式
@property (nonatomic, assign) NSTextAlignment titleTextAlignment;
/// cell图片(左边)
@property (nonatomic, strong) UIImage *icon;
/// cell标题color
@property (nonatomic, strong) UIColor *titleColor;
/// cell标题font
@property (nonatomic, strong) UIFont *titleFont;
/// 是否显示右导航箭头(默认为YES)
@property (nonatomic, assign) BOOL showArrow;
/// 箭头image
@property (nonatomic, strong) UIImage *arrowImage;
/// 箭头宽度
@property (nonatomic, assign) CGFloat arrowWidth;
/// 箭头高度
@property (nonatomic, assign) CGFloat arrowHeight;

/// 初始化方法
/// @param title 标题
/// @param block block类型
- (instancetype)initWithTitle:(NSString *)title actionBlock:(nullable ClickActionBlock)block;

/// 初始化方法
/// @param attributeTitle 富文本标题
/// @param block  block回调
- (instancetype)initWithAttributeTitle:(NSAttributedString *)attributeTitle actionBlock:(nullable ClickActionBlock)block;

- (CGFloat)getTitleWidth;

@end

NS_ASSUME_NONNULL_END
