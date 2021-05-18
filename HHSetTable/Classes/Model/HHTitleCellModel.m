//
//  HHTitleCellModel.m
//  Pods
//
//  Created by Henry on 2021/5/17.
//

#import "HHTitleCellModel.h"
#import "HHSetTableConst.h"
#import "NSBundle+HHSet.h"
#import "NSString+HHHeight.h"
#import "UIColor+HHSetTheme.h"

@implementation HHTitleCellModel

- (instancetype)initWithTitle:(NSString *)title actionBlock:(ClickActionBlock)block {
    self = [super init];
    if (self) {
        self.showArrow = YES;
        self.arrowImage = [NSBundle getImageForHHSet:@"icon_tableview_arrow"];
        self.arrowWidth = HH_ArrowWidth;
        self.arrowHeight = HH_ArrowHeight;
        self.titleTextAlignment = NSTextAlignmentLeft;
        self.titleFont = [UIFont systemFontOfSize:17];
        self.titleColor = [UIColor titleColor];
        self.title = title;
        self.selectionStyle = UITableViewCellSelectionStyleDefault;
        self.actionBlock = block;
    }
    return self;
}

- (instancetype)initWithAttributeTitle:(NSAttributedString *)attributeTitle actionBlock:(ClickActionBlock)block {
    self = [super init];
    if (self) {
        self.showArrow = YES;
        self.arrowImage = [NSBundle getImageForHHSet:@"icon_tableview_arrow"];
        self.actionBlock = block;
        self.arrowWidth = HH_ArrowWidth;
        self.arrowHeight = HH_ArrowHeight;
        self.titleTextAlignment = NSTextAlignmentLeft;
        self.titleFont = [UIFont systemFontOfSize:17];
        self.titleColor = [UIColor titleColor];
        self.attributeTitle = attributeTitle;
        self.selectionStyle = UITableViewCellSelectionStyleDefault;
        self.actionBlock = block;
    }
    return self;
}

- (NSString *)cellClass {
    return HHTitleCellModelCellClass;
}

- (CGFloat)getTitleWidth {
    return [self.title hh_widthWithFont:self.titleFont constrainedToheight:HH_CellHeight];
}

@end
