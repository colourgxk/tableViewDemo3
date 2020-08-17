//
//  DetailViewControllerModel.h
//  TableViewDemo3
//
//  Created by 关晓珂 on 2020/7/31.
//  Copyright © 2020 TencentIOS. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@class DetailViewControllerModelUnit;

@interface DetailViewControllerModel : NSObject


@property (nonatomic, strong) NSMutableArray <DetailViewControllerModelUnit *> *detailViewControllerModelContent;


- (NSInteger)countDetailViewControllerModel;
- (DetailViewControllerModelUnit *)viewControllerModelForDetailCellAtIndex:(NSUInteger)index;

@end



NS_ASSUME_NONNULL_END
