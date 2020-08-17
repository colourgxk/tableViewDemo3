//
//  ViewControllerModel.h
//  TableViewDemo3
//
//  Created by 关晓珂 on 2020/7/31.
//  Copyright © 2020 TencentIOS. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@class ViewControllerModelUnit;

@interface ViewControllerModel : NSObject

@property (nonatomic, strong) NSMutableArray <ViewControllerModelUnit *> *viewControllerModelContent;

- (NSInteger)countViewControllerModel;
- (ViewControllerModelUnit *)viewControllerModelForCellAtIndex:(NSInteger)index;
-(void)dataSourceWithLike;
-(void)dataSourceWithAll;
//-(void)dataSourceWithUnLike;
@end

NS_ASSUME_NONNULL_END
