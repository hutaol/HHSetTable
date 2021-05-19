//
//  NSObject+HHSet.h
//  Pods
//
//  Created by Henry on 2021/5/19.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (HHSet)

+ (void)runtimeReplaceFunctionWithSelector:(SEL)originselector
                           swizzleSelector:(SEL)swizzleSelector
                             isClassMethod:(BOOL)isClassMethod;

@end

NS_ASSUME_NONNULL_END
