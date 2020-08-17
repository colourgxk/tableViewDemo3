//
//  DetailViewController.m
//  TableViewDemo3
//
//  Created by 关晓珂 on 2020/7/31.
//  Copyright © 2020 TencentIOS. All rights reserved.
//
#import "DetailViewController.h"
#import "ViewController.h"
#import "DetailViewControllerModel.h"
#import "DetailViewControllerModelUnit.h"


@interface DetailViewController ()
@property (strong, nonatomic) UIButton * starButton;
@property (strong, nonatomic) UINavigationItem *navigationItem;
@property (strong, nonatomic) UIBarButtonItem *backButton;
@property (nonatomic, strong) DetailViewControllerModel *detailViewControllerModel;

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.detailViewControllerModel = [[DetailViewControllerModel alloc] init];
    //设置背景图片
    UIImageView *backgroundImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 400, 380)];
    //masksToBounds防止子元素溢出父视图
    backgroundImageView.layer.masksToBounds=YES;
    backgroundImageView.contentMode=UIViewContentModeScaleAspectFit;
    backgroundImageView.image = [UIImage imageNamed:@"background"];
    [self.view addSubview:backgroundImageView];
    
    
    
    //设置cell图片
    UIImageView *frontImageView = [[UIImageView alloc]initWithFrame:CGRectMake(170, 280, 110, 110)];
    frontImageView.layer.cornerRadius=frontImageView.frame.size.height/2;
    frontImageView.layer.masksToBounds=YES;
    
    
    //绘制边框
    frontImageView.layer.borderWidth=3.0;
    frontImageView.layer.borderColor=[UIColor whiteColor].CGColor;
    
    //绘制阴影
    //阴影颜色
    frontImageView.layer.shadowColor=[UIColor blackColor].CGColor;
    //offset为偏移量，为正表示向frame x，y坐标增加的方向偏移。
    frontImageView.layer.shadowOffset=CGSizeMake(5.0, 5.0);
    //opacity为透明度，默认为0，即表示透明的。把opacity设置成1或者YES，表示不透明，也可以设置成0.5或者类似的值呈现半透明。
    frontImageView.layer.shadowOpacity=0.5;
    //半径
    frontImageView.layer.shadowRadius=10;
    frontImageView.contentMode=UIViewContentModeScaleAspectFit;
    
    
    DetailViewControllerModelUnit *detailViewControllerModelContentAtIndex=[self.detailViewControllerModel viewControllerModelForDetailCellAtIndex: self.index-1];
    frontImageView.image = [UIImage imageNamed:detailViewControllerModelContentAtIndex.frontimageName];
    [self.view addSubview:frontImageView];


    UILabel *titleText =[ [UILabel alloc]initWithFrame:CGRectMake(20,380,100,30 )];
    //设置背景颜色
    titleText.backgroundColor = [UIColor clearColor];
    //设置字体颜色
    titleText.textColor = [UIColor blackColor];
    //设置Label上的文字
    titleText.text= detailViewControllerModelContentAtIndex.titleLabelText;
     //设置字体大小
    titleText.font = [UIFont systemFontOfSize:44];
    //使用粗体
    titleText.font=[UIFont boldSystemFontOfSize:22];
    //设置文本对齐方式
    titleText.textAlignment=NSTextAlignmentLeft;
    //设置行数默认为1，当为0时可以就是设置多行
    titleText.numberOfLines = 1;
    [self.view addSubview:titleText];


    UILabel *leftText =[ [UILabel alloc]initWithFrame:CGRectMake(30,450,100,30 )];
    leftText.backgroundColor = [UIColor clearColor];
    leftText.textColor = [UIColor blackColor];
    leftText.text= detailViewControllerModelContentAtIndex.leftLabelText;
    leftText.font = [UIFont systemFontOfSize:44];
    leftText.font=[UIFont boldSystemFontOfSize:16];
    leftText.textAlignment=NSTextAlignmentLeft;
    leftText.numberOfLines = 1;
    [self.view addSubview:leftText];


    UILabel *rightText =[ [UILabel alloc]initWithFrame:CGRectMake(200,450,100,30 )];
    rightText.backgroundColor = [UIColor clearColor];
    rightText.textColor = [UIColor blackColor];
    rightText.text=detailViewControllerModelContentAtIndex.rightLabelText;
    rightText.font = [UIFont systemFontOfSize:44];
    rightText.font=[UIFont boldSystemFontOfSize:16];
    rightText.textAlignment=NSTextAlignmentLeft;
    rightText.numberOfLines = 1;
    [self.view addSubview:rightText];
    
    
    UIButton *starButton = [UIButton buttonWithType:UIButtonTypeCustom];
    starButton.frame=CGRectMake(45, 355, 100, 75);
    starButton.selected=_likeOrNot;
    [starButton addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [starButton setImage:[UIImage imageNamed:@"off"] forState:UIControlStateNormal];
    [starButton setImage:[UIImage imageNamed:@"on"] forState:UIControlStateSelected];
    [self.view addSubview:starButton];
    
    self.navigationItem = [[UINavigationItem alloc] init];
    self.backButton = [[UIBarButtonItem alloc] initWithTitle:@"城市列表" style:UIBarButtonItemStyleDone target:self action:@selector(backCell)];
    self.navigationItem.leftBarButtonItem = self.backButton;

}

-(void)buttonClick:(UIButton *)sender{
    sender.selected = !sender.selected;
    _likeOrNot=sender.selected;
}


- (void)backCell{
    [self.navigationController popViewControllerAnimated:YES];
//    if(!_likeOrNot){
//        NSLog(@"Fail to Like cell");
//        return;
//    }
//    else{
        if([self.delegate respondsToSelector:@selector(sendStatus:)]){
            [self.delegate sendStatus:_likeOrNot];
         }
        NSLog(@"Like selected");
//    }

 
}
@end


