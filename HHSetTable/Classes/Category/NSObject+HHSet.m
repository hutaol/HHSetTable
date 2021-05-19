//
//  NSObject+HHSet.m
//  Pods
//
//  Created by Henry on 2021/5/19.
//

#import "NSObject+HHSet.h"
#import <objc/runtime.h>

@implementation NSObject (HHSet)

+ (void)runtimeReplaceFunctionWithSelector:(SEL)originselector
                           swizzleSelector:(SEL)swizzleSelector
                             isClassMethod:(BOOL)isClassMethod
{
    Method originMethod;
    Method swizzleMethod;
    if (isClassMethod == YES) {
        originMethod = class_getClassMethod([self class], originselector);
        swizzleMethod = class_getClassMethod([self class], swizzleSelector);
    }else{
        originMethod = class_getInstanceMethod([self class], originselector);
        swizzleMethod = class_getInstanceMethod([self class], swizzleSelector);
    }
    method_exchangeImplementations(originMethod, swizzleMethod);
}

@end
