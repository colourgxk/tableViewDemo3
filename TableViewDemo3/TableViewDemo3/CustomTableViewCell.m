//
//  CustomTableViewCell.m
//  TableViewDemo3
//
//  Created by 关晓珂 on 2020/7/31.
//  Copyright © 2020 TencentIOS. All rights reserved.
//

#import "CustomTableViewCell.h"

@implementation CustomTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{

  self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
  if(self){
      _starImage=[[UIImageView alloc] initWithFrame:CGRectMake(250, 10, 30, 30)];
      [self.contentView addSubview:_starImage];
   }
  return self;
}
@end
