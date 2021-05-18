//
//  HHCustomCellModel.h
//  Pods
//
//  Created by Henry on 2021/5/18.
//

#import <HHSetTable/HHSetTable.h>

NS_ASSUME_NONNULL_BEGIN

@interface HHCustomCellModel : HHBaseCellModel

- (instancetype)initWithCellIdentifier:(NSString *)cellIdentifier actionBlock:(ClickActionBlock)block;

@end

NS_ASSUME_NONNULL_END
