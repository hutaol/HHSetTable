//
//  HHMyCustomCellModel.h
//  HHSetTable_Example
//
//  Created by Henry on 2021/5/19.
//  Copyright © 2021 1325049637@qq.com. All rights reserved.
//

#import <HHSetTable/HHCustomCellModel.h>

NS_ASSUME_NONNULL_BEGIN

@interface HHMyCustomCellModel : HHCustomCellModel

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *detail;

@property (nonatomic, copy) void(^didSelectIconBlock)(UIImageView *imageView);

@end

NS_ASSUME_NONNULL_END
