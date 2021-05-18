//
//  HHSetTableConst.h
//  Pods
//
//  Created by Henry on 2021/5/17.
//

#ifndef HHSetTableConst_h
#define HHSetTableConst_h

#define HH_SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)
#define HH_SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)

static CGFloat const HH_CellHeight = 44; // cell默认高度
static CGFloat const HH_CellMargin = 15; // 标题左边的默认cell间距
static CGFloat const HH_SeparateHeight = 1; // cell分割线默认高度
static CGFloat const HH_ArrowWidth = 8; // 箭头默认宽度
static CGFloat const HH_ArrowHeight = 13; // 箭头默认高度

static CGFloat const HH_SectionHeight = 10; // 分组section之间的距离
static CGFloat const HH_CellPading = 10; // 距离cell上下默认边距pading


static NSString * const HHBaseCellModelCellClass = @"HHBaseTableViewCell";
static NSString * const HHTitleCellModelCellClass = @"HHTitleTableViewCell";
static NSString * const HHImageCellModelCellClass = @"HHImageTableViewCell";
static NSString * const HHSwitchCellModelCellClass = @"HHSwitchTableViewCell";
static NSString * const HHTextCellModelCellClass = @"HHTextTableViewCell";


#endif /* HHSetTableConst_h */
