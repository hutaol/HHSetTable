//
//  NSArray+HHSafeAccess.m
//  Pods
//
//  Created by Henry on 2021/5/17.
//

#import "NSArray+HHSafeAccess.h"

@implementation NSArray (HHSafeAccess)

- (instancetype)hh_objectWithIndex:(NSUInteger)index {
    if (index < self.count) {
        return self[index];
    }else{
        return nil;
    }
}

@end
