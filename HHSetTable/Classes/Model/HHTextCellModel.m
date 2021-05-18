//
//  HHTextCellModel.m
//  HHSetTable
//
//  Created by Henry on 2021/5/18.
//

#import "HHTextCellModel.h"
#import "HHSetTableConst.h"
#import "NSString+HHHeight.h"
#import "UIColor+HHSetTheme.h"

@interface HHTextCellModel ()

@end

@implementation HHTextCellModel

- (instancetype)initWithTitle:(NSString *)title detailText:(NSString *)detailText actionBlock:(ClickActionBlock)block {
    self = [super initWithTitle:title actionBlock:block];
    if (self) {
        self.detailFont = [UIFont systemFontOfSize:17];
        self.detailColor = [UIColor detailColor];
        self.detailNumberOfLines = 0;
        self.detailText = detailText;
    }
    return self;
}

- (instancetype)initWithTitle:(NSString *)title attributrDetailText:(NSAttributedString *)attributeDetailText actionBlock:(ClickActionBlock)block {
    self = [super initWithTitle:title actionBlock:block];
    if (self) {
        self.detailFont = [UIFont systemFontOfSize:17];
        self.detailColor = [UIColor detailColor];
        self.detailNumberOfLines = 1;
        self.attributeDetailText = attributeDetailText;
    }
    return self;
}

- (instancetype)initWithAttributeTitle:(NSAttributedString *)attributeTitle detailAttributeText:(NSAttributedString *)attributeDetailText actionBlock:(ClickActionBlock)block {
    self = [super initWithAttributeTitle:attributeTitle actionBlock:block];
    if (self) {
        self.detailFont = [UIFont systemFontOfSize:17];
        self.detailColor = [UIColor detailColor];
        self.detailNumberOfLines = 1;
        self.attributeDetailText = attributeDetailText;
    }
    return self;
}

- (instancetype)initWithAttributeTitle:(NSAttributedString *)attributeTitle detailText:(NSString *)detailText actionBlock:(ClickActionBlock)block {
    self = [super initWithAttributeTitle:attributeTitle actionBlock:block];
    if (self) {
        self.detailFont = [UIFont systemFontOfSize:17];
        self.detailColor = [UIColor detailColor];
        self.detailNumberOfLines = 0;
        self.detailText = detailText;
    }
    return self;
}

- (NSString *)cellClass {
    return HHTextCellModelCellClass;
}

- (void)setDetailText:(NSString *)detailText {
    // 如果detailText为nil 直接返回，为空不能返回
    if (detailText == nil) {
        return;
    }
    _detailText = detailText;
    if (self.attributeDetailText) {
        //如果外部设置过富文本，则忽略纯文本计算
        return;
    }
    [self heightSizeWithTextObject:detailText];
}

- (void)heightSizeWithTextObject:(id)object {
    //初始化文本高度  外部不可任意改变不然界面看起来很奇怪
    UIDeviceOrientation duration = [[UIDevice currentDevice] orientation];
    CGFloat screenWidth = 0;
    if (duration == UIDeviceOrientationLandscapeLeft || duration == UIDeviceOrientationLandscapeRight) {
        screenWidth =  HH_SCREEN_HEIGHT > HH_SCREEN_WIDTH ? HH_SCREEN_HEIGHT : HH_SCREEN_WIDTH;
    } else {
        screenWidth = HH_SCREEN_HEIGHT < HH_SCREEN_WIDTH ? HH_SCREEN_HEIGHT : HH_SCREEN_WIDTH;
    }
    CGFloat height = 0;
    UIFont *font;
    if ([object isKindOfClass:[NSString class]]) {
        height = [(NSString *)object hh_heightWithFont:self.detailFont constrainedToWidth:screenWidth-[self getTitleWidth]-60];
        font = self.detailFont;
    }
    if (height > self.cellHeight) {
        self.cellHeight = height + 2 * HH_CellPading;
    }
}

- (void)setDetailFont:(UIFont *)detailFont {
    _detailFont = detailFont;
    [self setDetailText:self.detailText];
}

@end
