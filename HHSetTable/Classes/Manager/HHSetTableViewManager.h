//
//  HHSetTableViewManager.h
//  Pods
//
//  Created by Henry on 2021/5/18.
//

#import <UIKit/UIKit.h>
@class HHSectionModel;

NS_ASSUME_NONNULL_BEGIN

@interface HHSetTableViewManager : NSObject <UITableViewDataSource, UITableViewDelegate>

- (instancetype)initSetTableViewManager:(NSMutableArray *)dataSource;

@property (nonatomic, strong) NSArray <HHSectionModel *> *footerArray; /// footer 数组
@property (nonatomic, strong) NSArray <HHSectionModel *> *headerArray; /// header 数组

@end

NS_ASSUME_NONNULL_END
