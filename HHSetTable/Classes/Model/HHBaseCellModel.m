//
//  HHBaseCellModel.m
//  Pods
//
//  Created by Henry on 2021/5/17.
//

#import "HHBaseCellModel.h"
#import "HHSetTableConst.h"

@interface HHBaseCellModel () {
    NSString *privateCellModelIdentifier; // 私有变量
}

@end

@implementation HHBaseCellModel

- (instancetype)init
{
    self = [super init];
    if (self) {
        CFAbsoluteTime now = CFAbsoluteTimeGetCurrent();
        NSString *threadNumber = [[[NSString stringWithFormat:@"%@", [NSThread currentThread]] componentsSeparatedByString:@"number = "].lastObject componentsSeparatedByString:@","].firstObject;
        privateCellModelIdentifier = [NSString stringWithFormat:@"%lf%@", now, threadNumber];
        
        _cellHeight = HH_CellHeight;

    }
    return self;
}

- (NSString *)identifier {
    return privateCellModelIdentifier;
}

+ (BOOL)accessInstanceVariablesDirectly {
    return NO;
}

@end
