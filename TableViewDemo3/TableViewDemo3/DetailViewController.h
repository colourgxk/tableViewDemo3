//
//  DetailViewController.h
//  TableViewDemo3
//
//  Created by 关晓珂 on 2020/7/31.
//  Copyright © 2020 TencentIOS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DetailViewControllerModelUnit.h"
#import "DetailViewControllerModel.h"
NS_ASSUME_NONNULL_BEGIN

@protocol CellDelegate <NSObject>

- (void)sendStatus:(BOOL)isSuccessful;

@end

@interface DetailViewController : UIViewController
@property  (nonatomic) NSUInteger index;
@property (weak, nonatomic) id <CellDelegate> delegate;
@property  (nonatomic) BOOL likeOrNot;


@end

NS_ASSUME_NONNULL_END
