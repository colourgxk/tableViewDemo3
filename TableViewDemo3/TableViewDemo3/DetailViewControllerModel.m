//
//  DetailViewControllerModel.m
//  TableViewDemo3
//
//  Created by 关晓珂 on 2020/7/31.
//  Copyright © 2020 TencentIOS. All rights reserved.
//

#import "DetailViewControllerModel.h"
#import "DetailViewControllerModelUnit.h"

@implementation DetailViewControllerModel

-(instancetype)init{
    self = [super init];
    if (self) {
        
    DetailViewControllerModelUnit *detailtianjin = [[DetailViewControllerModelUnit alloc] init];
    detailtianjin.backgroundImageName = @"background";
    detailtianjin.frontimageName = @"tianjin";
    detailtianjin.titleLabelText = @"天津";
    detailtianjin.leftLabelText=@"天津之眼";
    detailtianjin.rightLabelText=@"天津狗不理包子";
    
     DetailViewControllerModelUnit *detailbeijing = [[DetailViewControllerModelUnit alloc] init];
     detailbeijing.backgroundImageName = @"background";
     detailbeijing.frontimageName = @"beijing";
     detailbeijing.titleLabelText = @"北京";
     detailbeijing.leftLabelText=@"北京故宫";
     detailbeijing.rightLabelText=@"北京烤鸭";
    
     DetailViewControllerModelUnit *detailshanghai = [[DetailViewControllerModelUnit alloc] init];
     detailshanghai .backgroundImageName = @"background";
     detailshanghai .frontimageName = @"shanghai";
     detailshanghai .titleLabelText = @"上海";
     detailshanghai .leftLabelText=@"上海外滩";
     detailshanghai .rightLabelText=@"上海生煎";
    
     DetailViewControllerModelUnit *detailchongqing = [[DetailViewControllerModelUnit alloc] init];
     detailchongqing.backgroundImageName = @"background";
     detailchongqing.frontimageName = @"chongqing";
     detailchongqing.titleLabelText = @"重庆";
     detailchongqing.leftLabelText=@"重庆洪崖洞";
     detailchongqing.rightLabelText=@"重庆火锅";
    
     DetailViewControllerModelUnit *detailshenzhen = [[DetailViewControllerModelUnit alloc] init];
     detailshenzhen.backgroundImageName = @"background";
     detailshenzhen.frontimageName = @"shenzhen";
     detailshenzhen.titleLabelText = @"深圳";
     detailshenzhen.leftLabelText=@"深圳世界之窗";
     detailshenzhen.rightLabelText=@"深圳椰子鸡";
    
     
     self.detailViewControllerModelContent = [[NSMutableArray alloc] initWithObjects:detailtianjin, detailbeijing, detailshanghai, detailchongqing, detailshenzhen, nil];
    }
    return self;
}

- (NSInteger)countDetailViewControllerModel {
    return self.detailViewControllerModelContent.count;
}


- (DetailViewControllerModelUnit *)viewControllerModelForDetailCellAtIndex:(NSUInteger)index {
    return [self.detailViewControllerModelContent objectAtIndex:index];
}



@end
