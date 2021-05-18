//
//  NSArray+HHSafeAccess.h
//  Pods
//
//  Created by Henry on 2021/5/17.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSArray (HHSafeAccess)

/// 按照索引安全返回数组元素
/// @param index 索引index
- (instancetype)hh_objectWithIndex:(NSUInteger)index;

@end

NS_ASSUME_NONNULL_END
