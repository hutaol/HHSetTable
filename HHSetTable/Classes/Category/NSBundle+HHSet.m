//
//  NSBundle+HHSet.m
//  Pods
//
//  Created by Henry on 2021/5/17.
//

#import "NSBundle+HHSet.h"
#import "HHBaseTableViewCell.h"

@implementation NSBundle (HHSet)

+ (instancetype)hhResourceBundle {
    static NSBundle *hhBundle = nil;
    if (hhBundle == nil) {
        hhBundle = [NSBundle bundleWithPath:[[NSBundle mainBundle] pathForResource:@"HHSetTable" ofType:@"bundle"]];
        if (hhBundle == nil) {
            hhBundle = [NSBundle bundleWithPath:[[NSBundle bundleForClass:[HHBaseTableViewCell class]] pathForResource:@"HHSetTable" ofType:@"bundle"]];
        }
    }
    return hhBundle;
}

+ (UIImage *)getImageForHHSet:(NSString *)name {
    CGFloat scale = [[UIScreen mainScreen] scale];
    name = 3.0 == scale ? [NSString stringWithFormat:@"%@@3x.png", name] : [NSString stringWithFormat:@"%@@2x.png", name];
    NSString *path = [[[NSBundle hhResourceBundle] resourcePath] stringByAppendingPathComponent:name];
    UIImage *image = [UIImage imageWithContentsOfFile:path];
    if (!image) {
        image = [UIImage imageNamed:path];
    }
    return image;
}

+ (NSString *)getSetFilePath:(NSString *)name type:(NSString *)type {
    return [[NSBundle hhResourceBundle] pathForResource:name ofType:type];
}

@end
