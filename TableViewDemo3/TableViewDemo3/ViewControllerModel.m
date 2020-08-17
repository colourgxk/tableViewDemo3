//
//  ViewControllerModel.m
//  TableViewDemo3
//
//  Created by 关晓珂 on 2020/7/31.
//  Copyright © 2020 TencentIOS. All rights reserved.
//

#import "ViewControllerModel.h"
#import "ViewControllerModelUnit.h"
@interface ViewControllerModel()
@property (nonatomic, strong) NSMutableArray <ViewControllerModelUnit *> *orginalViewControllerModelContent;
@end


@implementation ViewControllerModel
-(instancetype)init{
    self = [super init];
    if (self) {
        
    ViewControllerModelUnit *tianjin = [[ViewControllerModelUnit alloc] init];
    tianjin.cityName = @"天津";
    tianjin.imageName = @"tianjin";
    tianjin.existOrNot = NO;
    
    ViewControllerModelUnit *beijing = [[ViewControllerModelUnit alloc] init];
    beijing.cityName = @"北京";
    beijing.imageName = @"beijing";
    beijing.existOrNot = NO;
    
    ViewControllerModelUnit *shanghai = [[ViewControllerModelUnit alloc] init];
    shanghai.cityName = @"上海";
    shanghai.imageName = @"shanghai";
    shanghai.existOrNot = NO;
    
    ViewControllerModelUnit *chongqing = [[ViewControllerModelUnit alloc] init];
    chongqing.cityName = @"重庆";
    chongqing.imageName = @"chongqing";
    chongqing.existOrNot = NO;
    
    ViewControllerModelUnit *shenzhen = [[ViewControllerModelUnit alloc] init];
    shenzhen.cityName = @"深圳";
    shenzhen.imageName = @"shenzhen";
    shenzhen.existOrNot = NO;
    
    self.orginalViewControllerModelContent = [[NSMutableArray alloc] initWithObjects:tianjin, beijing, shanghai, chongqing, shenzhen, nil];
    self.viewControllerModelContent = self.orginalViewControllerModelContent;
    }
    return self;
}

- (NSInteger)countViewControllerModel {
    return self.viewControllerModelContent.count;
}


- (ViewControllerModelUnit *)viewControllerModelForCellAtIndex:(NSInteger)index {
    return [self.viewControllerModelContent objectAtIndex:index];
}

-(void)dataSourceWithLike{
    NSMutableArray <ViewControllerModelUnit *> *cellDataSourceWithLike=[[NSMutableArray alloc] init];
    for(ViewControllerModelUnit *obj in self.orginalViewControllerModelContent){
        if(obj.existOrNot){
            [cellDataSourceWithLike  addObject:obj];
        }
    }
    self.viewControllerModelContent=cellDataSourceWithLike;
    
}

-(void)dataSourceWithAll{
    self.viewControllerModelContent=self.orginalViewControllerModelContent;
}

//-(void)dataSourceWithUnLike{
//    NSMutableArray <ViewControllerModelUnit *> *cellDataSourceWithUnLike=[[NSMutableArray alloc] init];
//    for(ViewControllerModelUnit *obj in self.orginalViewControllerModelContent){
//        if(!obj.existOrNot){
//            [cellDataSourceWithUnLike  addObject:obj];
//        }
//    }
//    self.viewControllerModelContent=cellDataSourceWithUnLike;
//
//}

@end
